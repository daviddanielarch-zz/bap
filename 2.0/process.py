import subprocess
import sys
import os
import check_buffer_overflow
import json
import argparse
import threading
import process
import shutil

devnull = file(os.devnull, 'w')


class Command(object):
    def __init__(self, cmd):
        self.cmd = cmd
        self.process = None
        self.stdout = None
        self.stderr = None
        
    def run(self, timeout):
        def target():
            #print 'Thread started'
            self.process = subprocess.Popen(self.cmd, 
                                            stdout=subprocess.PIPE,
                                            stderr=subprocess.PIPE
                                            )
            self.stdout, self.stderr = self.process.communicate()
            #print 'Thread finished'

        thread = threading.Thread(target=target)
        thread.start()

        thread.join(timeout)
        if thread.is_alive():
            #print 'Terminating process'
            self.process.terminate()
            #print self.stdout
            #print self.stderr
            thread.join()
        #print self.process.returncode
        
def get_functions(filename):
    cmd = Command(['get_functions','-r', filename])
    cmd.run(2)
    
    return cmd.stdout, cmd.stderr, cmd.process.returncode
    
def toil(filename, output, start=None):
    if start:
        print '\t [+] Creating JSON'
        process = subprocess.Popen(['toil','-binrecurseat', filename, start, '-tojson', '-o', output], 
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
    else:
        print '[+] Creating JSON'
        process = subprocess.Popen(['toil','-bin', filename, '-tojson', '-o', output], 
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    return stdout, stderr,  process.returncode


def check_bof(filename, data, start):
    relocations = check_buffer_overflow.get_relocations(filename)
    res = check_buffer_overflow.process_main(int(start,16), data, relocations, filename)
    if res:
        new_data, bof_vars = res
    else:
        return
    post = '| '.join(['(%s:u32 == 0xcafecafe:u32)' % var for var in bof_vars])
        # agregar bien
        #tmp_out.write('mem:?u32 = mem:?u32 with [0x80000000:u32, e_little]:u32 = 0x12341234:u32' + '\n')
     
    return new_data, post


def iltrans(filename, unroll_count, output_file):
    cmd = Command(['iltrans','-il', filename, '-to-cfg', '-prune-cfg', '-rm-indirect-ast', '-unroll', str(unroll_count), '-rm-cycles', '-to-ast', '-pp-ast', output_file])
    cmd.run(2)
    return cmd.stdout, cmd.stderr, cmd.process.returncode


def topredicate(filename, post, formula_out):            
    cmd = Command(['topredicate','-il', filename, '-solver', 'z3', '-post', '%s' % post, '-stp-out', formula_out])
    cmd.run(5)
    return cmd.stdout, cmd.stderr,  cmd.process.returncode
    
    
def z3(fun_name, formula):
    try:
        res = subprocess.check_output(['z3', '-smt2', formula])
        print res
        with file('process_test/model_%s' % fun_name,'w') as model:
            model.write(res)
        return True
    except:
        return False
        
def main(filename, debug):
    errors = 0
    unsat = 0
    bofs = 0
    recurse = 0
    single_translate = False
    solver_timeout = 0
    
    if debug:
        path = './debug/%s' % os.path.basename(filename)
        if not os.path.exists(path):
            os.mkdir(path)
    
    _, error, retcode = toil(filename, 'tmp.json')
    if retcode:
        print '[x] Error translating full binary to BIL'
        print '[+] Translating each function independently'
        single_translate = True
        
    functions, error, retcode = get_functions(filename)
    if retcode:
        print '[x] Error getting functions'
        print '\t %s' % error
        print '[x] Aborting'
        sys.exit(1)
    functions = functions.strip().split('\n')

    for fun in functions:
        try:
            fun_name, start, end = fun.split()
        except:
            continue
        print '[+] Running %s' % fun_name
        
        if single_translate:
             _, error, retcode = toil(filename, 'tmp.json', start)
             if retcode:
                print '[x] Skipping function'
                errors += 1
                continue 
                
        print '\t [+] Running check_overflow'        
           
        with file('tmp.json','r') as fd, file('tmp.il','w') as tmp_out:
            data = json.loads(fd.read())
            res = check_bof(filename, data, start)
            if res:
                new_data, post = res
            else:
                print '\t [x] Recursive function found. Skiping %s' % fun_name
                recurse += 1
                continue
            
            tmp_out.write('mem:?u32 = mem:?u32 with [0x80000000:u32, e_little]:u32 = 0x12341234:u32' + '\n')
            for elem in new_data:
                tmp_out.write(str(elem) + '\n') 
        
        if not post:
            print '[*] No postcondition was generated. Skiping'
            unsat += 1
            continue
                    
        print '\t [+] Runnig iltrans'
        _, error, ret_code = iltrans('tmp.il', 50, 'tmp2.il')
        shutil.copyfile('tmp.il',os.path.join(path,'%s.il' % fun_name))                 
        if error:
            errors += 1
            if len(error) > 100:
                print '\t [*] %s [continues]' % error[:100]
            else:
                print '\t [x] %s' % error   
            if debug:
                with file(os.path.join(path,fun_name),'w') as fd:
                    fd.write(error)
                    shutil.copyfile('tmp.il',os.path.join(path,'%s.il' % fun_name))                 
                    
            print '\t [x] Skiping %s' % fun_name        
            continue
        
        print '\t [+] Running topredicate with post %s' % post
        _,_, err = topredicate('tmp2.il', post, 'tmp.f')
        if err < 0:
            print '[x] Solver took too long.'
            print '[x] Skipping'
            solver_timeout += 1
            continue
        if not z3(fun_name, 'tmp.f'):
            unsat += 1
            print '\t [+] Unsat'
        else:
            bofs += 1
            print '\t [+] Sat. Check the model on process_test/'
            
    print '[*] Functions found: %d' % len(functions)      
    print '[*] Errors: %d' % errors
    print '[*] Bofs: %d' % bofs
    print '[*] Unsat: %d' % unsat
    print '[*] Recursive: %d' % recurse
    print '[*] Solver timeout: %d' % solver_timeout
    
    try:
        os.remove('tmp.f')
    except:
        pass
    os.remove('tmp.il')
    os.remove('tmp.json')
    os.remove('tmp2.il')
    
            
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Check for buffer overflows on BAP IL.')
    parser.add_argument('-f', required=True, type=str,
                   help='Binary file', dest='filename')
    parser.add_argument('-d', required=False, action='store_true',
                   help='Debug', dest='debug')                   

    args = parser.parse_args()
    
    main(args.filename, args.debug)
