import json
import string
import random
import argparse
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

bof_vars = []

def process_main(data, relocations):
    statements = [parse_statement(stmt) for stmt in data]
    functions =  get_functions(statements)
    random_name = ''.join(random.choice(random_chars) for _ in range(6))
    new_func_name = 'call%s' % random_name
    
    _,new_il = copy_function(get_main(statements),functions, "the_end", relocations, new_func_name)
    
    # We need to finish the execution with a halt statement
    # We are replacing the ret from main to a jmp to this halt statement
    halt_label = Label(StrLabel('the_end'))    
    bool_reg = Register(1)
    true = Int(1,bool_reg)
    halt_true = Halt(true,[]) 

    new_il.append(halt_label)
    new_il.append(halt_true)
    
    return new_il
    
def get_ret_label(label):
    name,_,address = label.split('_')
    return '%s_pc_0x%x' % (name, int(address,16) + 5)
    
def copy_function(data, functions, ret_label, relocations, func_name):
    """
    Return a copy of the fuction with all label_stmt with addresses removed.
    If we have instructions with the same addresses we are going to get errors
    while parsing the instruction.
    All addresses are replaced with labels. 
    """   
    instrs = []
    copied_functions = []
    first_label = None
    random_name = ''.join(random.choice(random_chars) for _ in range(6))
    
    for stmt in data:
        # We are saving the assembler instruction
        if '@asm' in str(stmt):
            for attr in stmt.attrs:
                if '@asm' in str(attr):
                    asm = attr
                    
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
                    new_func_name = 'call_%s' % random_name
                    label, new_function = copy_function(deepcopy(functions[address]), 
                                                        functions, 
                                                        get_ret_label(last_label),
                                                        relocations,
                                                        new_func_name)
                                                        
                    stmt.exp = Lab(label)
                    instrs.append(stmt)
                    
                    copied_functions.append(new_function)
            # If there is an indirect jump we analyze two options
            # * If the indirect jump is a ret then replace the ret address with
            #   the corresponding label
            # * If the indirect's jump address is on the relocations we inline
            #   the external function call
            else:
                if 'ret' in str(stmt):
                    bof_var = Variable(10, 'bof_%s' % random_name, Register(32))
                    bof_vars.append('bof_%s' % random_name)                    
                    bof_check = Move(bof_var, stmt.exp)
                    stmt.exp = Lab(ret_label)                    
                    instrs.append(bof_check)
                    instrs.append(stmt)
                elif 'jmp mem:?u32' in str(stmt):
                    address = stmt.exp.address.inte
                    if address in relocations:
                        function_path = '/home/davida/bap-0.7/bap/2.0/asm/%s.json' % relocations[address]
                        # If the external function is defined we inline it
                        try:
                            imported_function = [parse_statement(stmt) for stmt in json.loads(open(function_path).read())]
                            label, new_function = copy_function(imported_function, 
                                                            functions, 
                                                            ret_label,
                                                            relocations,
                                                            '%s_%s' % (relocations[address], random_name))       
                            for instr in new_function:
                                instrs.append(instr)                                                                                   
                                
                        # If its not defined replace the jmp address with the
                        # corresponding label        
                        except:
                            stmt.exp = Lab(ret_label)
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
             
    return first_label, instrs
                
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
		    		
    raise Exception("Bad start address")
	
def get_main(data):
    """
    Get all the instructions until the first ret, this is the
    main function.
    """
    main = []
    for stmt in data:
        # We find the ret and replace it with a halt true instruction.
        if '@str "ret"' in str(stmt.attrs):
            main.append(stmt)
            return main
        else:
            main.append(stmt)

def get_functions(data):
    """
    Return a dict with all functions found of the form
    functions[function_address] = [instruction_list]
    """
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

                
    return functions

def get_relocations(fd):
	""" 
	Return a dict with the relocations contained in a file
	"""
	if not fd:
	    print 'Relocations not found'
	    return {}
	    
	elffile = ELFFile(fd)
	relocations = {}
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

	return relocations
	            			

def main():

    parser = argparse.ArgumentParser(description='Check for buffer overflows on BAP IL.')
    parser.add_argument('-j', type=argparse.FileType('r'), required=True,
                   help='JSON file with the BAP IL', dest='json_file')
    parser.add_argument('-r', type=argparse.FileType('r'), 
                   help='Binary we got the JSON IL from', dest='reloc_file')
    parser.add_argument('-o', dest='outfile',type=argparse.FileType('w'), 
                    default='out.il', help='output file')

    args = parser.parse_args()
    data = json.loads(args.json_file.read())
    relocations = get_relocations(args.reloc_file)

    new_data = process_main(data, relocations)

    for elem in new_data:
        args.outfile.write(str(elem) + '\n')

    print ' | '.join(['(%s:u32 == 0xcafecafe:u32)' % var for var in bof_vars])
    
if __name__ == '__main__':
    main()  
