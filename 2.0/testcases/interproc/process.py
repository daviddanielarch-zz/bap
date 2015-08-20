import subprocess
import sys
import os

if len(sys.argv) < 3:
    print 'Need a filename and value'
    sys.exit(1)
    
filename = sys.argv[1]
value = int(sys.argv[2])

functions = subprocess.check_output(['get_functions','-r', filename])
for fun in functions.strip().split('\n'):
    fun_name, start, end = fun.split()
    if fun_name == 'main':
        main_start = int(start,16)
        print 'Found main 0x%x' % main_start        

print 'Creating JSON'
subprocess.check_output(['toil','-bin', filename, '-tojson', '-o', 'tmp.json'])

subprocess.check_output(['toil','-bin', filename,'-o', 'tmp2.il'])

print 'Running check_overflow'
print subprocess.check_output(['check_buffer_overflow.py','-m', '0x%x' % main_start,'-j', 'tmp.json', '-r', filename, '-o', 'tmp.il']) 

os.remove('tmp.json')

print 'Runnig iltrans'
subprocess.check_output(['iltrans','-il', 'tmp.il', '-to-cfg', '-prune-cfg', '-rm-indirect-ast', '-unroll', '4', '-rm-cycles', '-to-ast', '-pp-ast', filename+'.il'])

#os.remove('tmp.il')
print 'Running topredicate'
subprocess.check_output(['topredicate','-il', filename+'.il', '-solver', 'z3', '-post', 'R_EAX:u32 == %d:u32' % value, '-stp-out', 'tmp.f'])

#os.remove(filename+'.il')
res = subprocess.check_output(['z3', '-smt2', 'tmp.f']) 

os.remove('tmp.f')
print res
