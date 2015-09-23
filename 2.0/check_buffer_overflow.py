#!/usr/bin/env python

import json
import string
import random
import pefile
import argparse
import traceback
import subprocess
import re
from copy import deepcopy
from elftools.elf.descriptions import describe_reloc_type
from elftools.common.py3compat import (
        ifilter, byte2int, bytes2str, itervalues, str2bytes)
from elftools.elf.elffile import ELFFile
from elftools.elf.relocation import RelocationSection
from elftools.elf.descriptions import describe_reloc_type

from parser.parse_stmt import *
from bap_stmt import *
from bap_exp import *
random_chars = string.ascii_uppercase + string.digits

BUFF_SIZE = 0x1000 # 4KB
input_address = 0x80000000
counter = 1
sys.setrecursionlimit(5000)

function_call_stack = []


def process_main(main_address, data, relocations, filename):
    global counter
    statements = [parse_statement(stmt) for stmt in data]
    
    functions =  get_functions(statements)
    new_func_name = 'fun%s' % str(counter)
    copied_function = copy_function(get_main(main_address, statements, filename),functions, "the_end", relocations, new_func_name, [])
    if copied_function:
        _,new_il, bof_vars = copied_function
    else:
        return
    
    # We need to finish the execution with a halt statement
    # We are replacing the ret from main to a jmp to this halt statement
    halt_label = Label(StrLabel('the_end'))    
    bool_reg = Register(1)
    reg32 = Register(32)
    true = Int(1,bool_reg)
    halt_true = Halt(true,[])
    esp = Move(Variable(1,'R_ESP',reg32),Int(0x80000000,reg32))
    #mem = Move(Variable(1,'mem',TMem(32)),Int(0x80000000,reg32))

    new_il.insert(0,esp)
    #new_il.insert(1,mem)
    new_il.append(halt_label)
    new_il.append(halt_true)
    
    return new_il, bof_vars
    
def get_ret_label(label):
    name,_,address = label.split('_')
    return '%s_pc_0x%x' % (name, int(address,16) + 5)
    
def copy_imported_function(address, functions, ret_label, relocations, random_name, bof_vars):
    global input_address
    
    function_path = './asm/%s.json' % relocations[address]
    
    try:
        function_data = open(function_path,'r').read()
    except:
        return
        
            
    source_address = input_address + BUFF_SIZE
    function_data = function_data.replace('SOURCE_ADDRESS', str(source_address))
    if 'SOURCE_ADDRESS' in function_data:
        sys.exit(1)
    function_data = json.loads(function_data)
    
    input_address += BUFF_SIZE
    imported_function = [parse_statement(stmt) for stmt in function_data]
    copied_function = copy_function(imported_function, 
                                    functions, 
                                    ret_label,
                                    relocations,
                                    '%s_%s' % (relocations[address], random_name),
                                    bof_vars)
    if copied_function:                                    
        label, new_function, bof_vars = copied_function
    else:
        return
                                    
                                    
    print '[*] %s is taking data from 0x%x' % (label, source_address)   
    return label, new_function                                     

def get_functions_range(filename):
    process = subprocess.Popen(['get_functions','-r', filename],
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE
                                )
    functions, error = process.communicate()
    functions = functions.strip().split('\n')
    functions_range = {}
    
    for fun in functions:
        try:
            fun_name, start, end = fun.split()
        except:
            pass
        functions_range[int(start, 16)] = int(end, 16)
    return functions_range
                                        
def copy_function(data, functions, ret_label, relocations, func_name,  bof_vars):
    """
    Return a copy of the fuction with all label_stmt with addresses removed.
    If we have instructions with the same addresses we are going to get errors
    while parsing the instruction.
    All addresses are replaced with labels. 
    """   
    global counter
    func_address = data[0].label.addr
    
    # Recursive call detection
    if func_address in function_call_stack:
        print "[*] Recursive call detected, we don't support recursive calls"
        print '[*] Printing call stack'
        function_call_stack.append(func_address)
        for depth,elem in enumerate(function_call_stack):
            print '[*] %s 0x%x' % ('\t' * depth, elem)
        return  
    else:
        function_call_stack.append(func_address)
    
    instrs = []
    copied_functions = []
    first_label = None
    for stmt in data:
        #random_name = str(counter)
        # We are saving the assembler instruction
        if '@asm' in str(stmt):
            for attr in stmt.attrs:
                if '@asm' in str(attr):
                    asm = attr
                    
        # Indirect call (Window's relocations)            
        elif re.match('T_target[_]*[0-9]*:u32 = ', str(stmt)):
            T_target = stmt
            instrs.append(stmt)
            
        # Append to the label an unique identifier                     
        elif 'label' in str(stmt):
            new_label = StrLabel('{0}_{1}'.format(func_name ,stmt.label.name))
            stmt.label = new_label
            stmt.attrs.append(asm)
            instrs.append(stmt)
            
            # We need the first label so we can know which label to jump from
            # an inlined call.
            if not first_label:
                first_label = new_label.name
                
            # We need the latest label for the ret instruction at the end
            # of the next function    
            last_label = new_label.name
                        
        # CJmp uses and address and a label for branching, so we are replacing
        # both of them to make things work.    
        elif str(stmt).startswith('cjmp'):
            if type(stmt.iftrue) == type(Lab()):
                stmt.iftrue.string = '{0}_{1}'.format(func_name,
                                                      stmt.iftrue.string)
            else:
                address = stmt.iftrue.inte
                new_lab = Lab('{0}_pc_0x{1:x}'.format(func_name, address))
                stmt.iftrue = new_lab
                
            if type(stmt.iffalse) == type(Lab()):
                stmt.iffalse.string = '{0}_{1}'.format(func_name, 
                                                      stmt.iffalse.string)
            else:
                address = stmt.iffalse.inte
                new_lab = Lab('{0}_pc_0x{1:x}'.format(func_name, address))
                stmt.iffalse = new_lab
                
            instrs.append(stmt)
            
        elif type(stmt) == type(Jmp()):
            # If there is a direct jump to a function we inline it
            if type(stmt.exp) == type(Int(0)):
                address = stmt.exp.inte
                if address in functions:
                    counter = counter + 1
                    new_func_name = 'fun%s' % str(counter)
                    copied_function = copy_function(deepcopy(functions[address]), 
                                                        functions, 
                                                        get_ret_label(last_label),
                                                        relocations,
                                                        new_func_name,
                                                        bof_vars)
                    if copied_function:                                                        
                        label, new_function, bof_vars = copied_function
                    else:
                        return                                    
                                                        
                    stmt.exp = Lab(label)
                    instrs.append(stmt)
                    
                    copied_functions.append(new_function)
                else:
                    jmp_label = Lab('%s_pc_0x%x' % (func_name, address))
                    instrs.append(Jmp(jmp_label))
                    
            elif type(stmt.exp) == type(Lab('a')):
                stmt.exp = Lab('%s_%s' % (func_name, stmt.exp.string))
                instrs.append(stmt)
            # If there is an indirect jump we analyze two options
            # * If the indirect jump is a ret then replace the ret address with
            #   the corresponding label
            # * If the indirect's jump address is on the relocations we inline
            #   the external function call
            else:
                if '@str "ret"' in str(stmt):
                    counter = counter + 1
                    new_name = str(counter)
                    bof_var = Variable(10, 'bof_%s' % new_name, Register(32))
                    bof_vars.append('bof_%s' % new_name)                    
                    bof_check = Move(bof_var, stmt.exp)
                    stmt.exp = Lab(ret_label)                    
                    instrs.append(bof_check)
                    instrs.append(stmt)
                    
                # Linux relocations    
                elif re.match('jmp mem[_]*[0-9]*:\?u32', str(stmt)):
                    address = stmt.exp.address.inte
                    if address in relocations:
                        counter = counter + 1
                        new_func_name = 'fun%s' % str(counter)
                        copied_function = copy_imported_function(address, 
                                                              functions, 
                                                              ret_label, 
                                                              relocations, 
                                                              new_func_name,
                                                              bof_vars)
                        if copied_function:
                            label, new_function = copied_function
                            for instr in new_function:
                                instrs.append(instr)                                                                                   
                        else:        
                            # If its not defined fix ESP value.  
                            # ESP = ESP + 4
                            var = Variable(1, 'R_ESP', Register(32))  
                            exp = BinOp('plus', 
                                        Variable(1, 'R_ESP', Register(32)), 
                                        Int(4,Register(32))
                                        )
                            instrs.append(Move(var, exp)) 
                            # And replace the jmp address with the corresponding label    
                            stmt.exp = Lab(ret_label)
                            instrs.append(stmt)
                            
                # Windows relocations
                elif 'T_target' in str(stmt):
                    try:
                        address = T_target.exp.address.inte
                        print 'reloc'
                        if address in relocations:
                            print 'asd'
                            counter = counter + 1
                            new_func_name = 'fun%s' % str(counter)                        
                            copied_function = copy_imported_function(address, 
                                                                  functions, 
                                                                  ret_label, 
                                                                  relocations, 
                                                                  new_func_name,
                                                                  bof_vars)
                            if copied_function:
                                label, new_function = copied_function
                                # Remove the last jmp from the ret
                                # We are inlining the function so we don't need to
                                # jump anywhere.    
                                for instr in new_function[:-1]:
                                    instrs.append(instr)                                                                                  
                            else:                                                           
                                # If its not defined fix ESP value.  
                                # ESP = ESP + 4
                                var = Variable(1, 'R_ESP', Register(32))  
                                exp = BinOp('plus', 
                                            Variable(1, 'R_ESP', Register(32)), 
                                            Int(4,Register(32))
                                            )
                                instrs.append(Move(var, exp)) 
                                # And replace the jmp address with the corresponding labe    
                                stmt.exp = Lab(ret_label)
                                instrs.append(stmt)
                    except:
                        instrs.append(stmt)
                # If none of the above cases happens just append the
                # instruction without any changes.                            
                else:
                    instrs.append(stmt)
                
        # We can append other instruction types without further modifications.
        else:
            instrs.append(stmt)

    # Append to the end all the functions retrieved            
    for copied_func in copied_functions:
        instrs = instrs + copied_func
             
    function_call_stack.pop()
    return first_label, instrs, bof_vars
                
def get_function(call_address,data):
    """
    Get the function starting at @call_address, get elements until ret.
    In case the first instruction is an indirect jump we assume it's
    a realocation, so we add the next instruction because a realocation
    looks like this:
        addr 0x8048380 @asm "jmp    *0x804a018"
        label pc_0x8048380
        jmp mem:?u32[0x804a018:u32, e_little]:u32
    """
    function = []
    start_found = False
	
    for pos, stmt in enumerate(data):
        if '@asm' in str(stmt):
            if call_address == stmt.label.addr:
                start_found = True

        if start_found:
            function.append(stmt)

        if '@str "ret"' in str(stmt) and start_found:
            return function    
		
		# Check if this is an indirect jump 
		# (we are assuming this is a realocation)
        if 'jmp    *' in str(stmt) and start_found:
            function.append(data[pos+1]) # label
            function.append(data[pos+2]) # jmp mem?u32[]
            return function
    raise Exception("Bad start address 0x%x" % call_address)
	
def get_main(address, data, filename):
    """
    Get all the instructions until the first ret, this is the
    main function.
    """
    try:
        end = get_functions_range(filename)[address]
    except:
        return get_function(address, data)
        
    function = []
    for pos, stmt in enumerate(data):
        if '@asm' in str(stmt):
            if stmt.label.addr >= address and stmt.label.addr < end:
                append_elems = True
            else:
                append_elems = False
                
        if append_elems:
            function.append(stmt)
            
    #for elem in function:
    #    print str(elem)
    return function    

def get_functions(data):
    """
    Return a dict with all functions found of the form
    functions[function_address] = [instruction_list]
    """
    #print '[*] Getting functions'
    functions = {}
    for stmt in data:
        if '@asm "call' in str(stmt):
            # Will only work for direct calls
            try:
                address = int(str(stmt.attrs)[15:-1],16)
                if address not in functions:
                    functions[address] = get_function(address, data)
                    
            # This must be an indirect call.
            except:
                pass

    #print '[*] %d functions found' % len(functions)
    return functions

def get_relocations(filename):
    """ 
    Return a dict with the relocations contained in a file
    Taken and modified from 
    https://github.com/eliben/pyelftools/blob/master/scripts/readelf.py
    """
    #print '[*] Getting relocations'
    relocations = {}
    if not filename:
        print '[*] Relocations not found'
        return relocations
	    
    try:
        pe = pefile.PE(filename)
        for entry in pe.DIRECTORY_ENTRY_IMPORT:
            for imp in entry.imports:
                relocations[imp.address] = imp.name
                        
    except pefile.PEFormatError:
        with file(filename,'r') as fd:
            elffile = ELFFile(fd)

            has_relocation_sections = False
            for section in elffile.iter_sections():
                if not isinstance(section, RelocationSection):
                    continue

                has_relocation_sections = True
                # The symbol table section pointed to in sh_link
                symtable = elffile.get_section(section['sh_link'])

                for rel in section.iter_relocations():
                    offset = rel['r_offset'] 

                    symbol = symtable.get_symbol(rel['r_info_sym'])
                    # Some symbols have zero 'st_name', so instead what's used is
                    # the name of the section they point at
                    if symbol['st_name'] == 0:
                        symsec = elffile.get_section(symbol['st_shndx'])
                        symbol_name = symsec.name
                    else:
                        symbol_name = symbol.name
                        relocations[offset] = bytes2str(symbol_name)
    #print '[*] Getting relocations DONE'                        
    return relocations
	            			

def main():

    parser = argparse.ArgumentParser(description='Check for buffer overflows on BAP IL.')
    parser.add_argument('-j', required=True, type=argparse.FileType('r'),
                   help='JSON file with the BAP IL', dest='json_file')
    parser.add_argument('-m', required=True,
                   help='Main function address', dest='main_address')                   
    parser.add_argument('-r', help='Binary we got the JSON IL from', 
                        dest='reloc_file')
    parser.add_argument('-o', dest='outfile',type=argparse.FileType('w'), 
                    default='out.il', help='output file')

    args = parser.parse_args()
    data = json.loads(args.json_file.read())
    relocations = get_relocations(args.reloc_file)

    new_data, bof_vars = process_main(int(args.main_address,16), data, relocations, args.reloc_file)

    for elem in new_data:
        args.outfile.write(str(elem) + '\n')
        
    print '[*] Use the following postcondition on topredicate.' 
    print '[*] \t' + '| '.join(['(%s:u32 == 0xcafecafe:u32)' % var for var in bof_vars])
    
if __name__ == '__main__':
    main()  
