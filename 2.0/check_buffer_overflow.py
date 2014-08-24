import json
import string
import random
from parser.parse_stmt import *
from bap_stmt import *
from bap_exp import *
random_chars = string.ascii_uppercase + string.digits

def process_main(data):
    statements = [parse_statement(stmt) for stmt in data]
    functions =  get_functions(statements)
    _,new_il = copy_function(get_main(statements),functions, "halt")
    
    # We need to finish the execution with a halt statement
    # We are replacing the ret from main to a jmp to this halt statement
    halt_label = Label(StrLabel('halt'))    
    bool_reg = Register(1)
    true = Int(1,bool_reg)
    halt_true = Halt(true,[]) 

    new_il.append(halt_label)
    new_il.append(halt_true)
    
    return new_il
    
def get_ret_label(label):
    name,_,address = label.split('_')
    return '%s_pc_0x%x' % (name, int(address,16) + 5)
    
def copy_function(data, functions, ret_label):
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
    func_name = 'call%s' % random_name
    
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
                
            # We need the label for the ret    
            last_label = new_label.name
                        
        # CJmp uses and address and a label for branching, so we are replacing
        # both of them to make things work.    
        elif str(stmt).startswith('cjmp'):
            if type(stmt.iftrue) == type(Lab()):
                stmt.iftrue.string = '{0}_{1}'.format(func_name,
                                                      stmt.iftrue.string)
            else:
                address = stmt.iftrue.inte
                new_lab = Lab('{0}_pc_{1}'.format(func_name, address))
                stmt.iftrue = new_lab
                
            if type(stmt.iffalse) == type(Lab()):
                stmt.iffalse.string = '{0}_{1}'.format(func_name, 
                                                      stmt.iffalse.string)
            else:
                address = stmt.iffalse.inte
                new_lab = Lab('{0}_pc_{1}'.format(func_name, address))
                stmt.iffalse = new_lab
                
            instrs.append(stmt)
            
        elif type(stmt) == type(Jmp()):
            # If there is a direct jump to a function we inline it
            if type(stmt.exp) == type(Int(0)):
                address = stmt.exp.inte
                if address in functions:
                    label, new_function = copy_function(functions[address], 
                                                        functions, 
                                                        get_ret_label(last_label))
                    stmt.exp = Lab(label)
                    instrs.append(stmt)
                    
                    copied_functions.append(new_function)
                    #print 'Call to 0x%x found' % stmt.exp.inte
            else:
                if 'ret' in str(stmt):
                    stmt.exp = Lab(ret_label)
                    instrs.append(stmt)
                else:
                    instrs.append(stmt)
                #print 'Indirect jump found {0}, doing nothing.'.format(str(stmt))
                
        # We can append other instruction types without further modifications.
        else:
            instrs.append(stmt)
            
    for copied_func in copied_functions:
    #    print '"*************************"'
    #    for elem in copied_func:
    #        print elem     
    #    print '"*************************"'
         instrs = instrs + copied_func                                       
    #import sys
    #sys.exit(1)    
    #print '"*********************************************************************************"'     
    return first_label, instrs
                
#def inline_functions(function, data):
#    for stmt in data:
#        if '@str "call"' in str(stmt):
#            if stmt.exp.inte in functions:
                
            

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
            address = int(str(stmt.attrs)[15:-1],16)
            if address not in functions:
                functions[address] = get_function(address, data)
                
    return functions
            			
data = json.loads(file('/home/davida/bap-0.7/bap/2.0/test.json','r').read())
new_data = process_main(data)

for elem in new_data:
    print elem     
