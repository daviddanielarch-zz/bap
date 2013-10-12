import simplejson
import pprint
import dumper
import copy

def get_calls_address(data):
	"""
	Returns a dict with subfunctions addresses as keys and 
	call places as values
	"""
	calls = {}
	for elem in data:
		if is_instruction(elem):
			(address,asm) = get_asm(elem)
			if 'call' in asm:
				dest = int(asm.split()[1],16)
				if dest in calls.keys():
					calls[dest].append(address)
				else:
					calls[dest] = [address]
	return calls




def fix_single_function(ret_address,call_address,data):
	"""
	Takes a function starting at @call_addres and replaces 
	the ret address with @ret_address
	"""
	start_found = False

	for elem in data:

		if is_instruction(elem):
			(address,asm) = get_asm(elem)
			if address == call_address:
				
				start_found = True
				#print "Start found"

		if is_jmp(elem) and start_found:
			if 'ret' in elem['jmp']['attributes'][0]['strattr']:
				elem['jmp']['exp'] =  {'inte': {'int': str(ret_address), 'typ': {'reg': 32}}}
				elem['jmp']['attributes'] = [{'strattr': 'fixed'}]
				return

	raise "Bad start address"

def fix_call(new_jmp_address,call_address,data):
	"""
	Replace the jmp address from @call_addres with @new_jmp_address
	"""
	start_found = False
	
	for elem in data:

		if is_instruction(elem):
			(address,asm) = get_asm(elem)
			#print "%x %s" % (address,asm)
			if address == call_address:
				start_found = True
				#print "Start found"

		if is_jmp(elem) and start_found:
			if 'call' in elem['jmp']['attributes'][0]['strattr']:
				elem['jmp']['exp'] =  {'inte': {'int': new_jmp_address, 'typ': {'reg': 32}}}
				#elem['jmp']['attributes'] = [{'strattr': 'fixed'}]
				return

	raise "Bad start address"

def get_function(call_address,data):
	"""
	Get the function starting at @call_address, get elements until ret
	"""
	function = []
	start_found = False
	
	for elem in data:

		if is_instruction(elem):
			(address,asm) = get_asm(elem)
			#print "%x %s" % (address,asm)
			if address == call_address:
				start_found = True
				#print "Start found"

		if start_found:
			function.append(elem)

		if is_jmp(elem) and start_found:
			#print elem
			if 'ret' in elem['jmp']['attributes'][0]['strattr']:
				return function


				
	raise "Bad start address"

def get_asm(elem):
	"""
	If elem in an instruction, then gets the address and assembler.
	"""
	address = elem['label_stmt']['label']['addr']
	asm = elem['label_stmt']['attributes'][0]['asm']
	return (address,asm)

def is_jmp(elem):
	"""
	Check if the element is a jmp
	"""
	if 'jmp' in elem.keys():
		return True
	else:
		return False

def is_instruction(elem):
	"""
	Check whetever the passed element is an instruction.
	"""
	if 'label_stmt' in elem.keys():
		stmt = elem['label_stmt']
		attrs = stmt['attributes']
		if attrs:
			return True
		else:
			return False
	return

def is_label(elem):
	"""
	Check whetever the passed element is a label.
	"""
	if 'label_stmt' in elem.keys():
		stmt = elem['label_stmt']
		attrs = stmt['attributes']
		if not attrs:
			return True
		else:
			return False
	return

def fix_final_ret(data):
	"""
	Replaces the last ret of the program with a halt instruction
	This is needed in order to be able to use topredicate
	"""
	for i,elem in enumerate(data):
		if is_jmp(elem):
			#print elem
			if 'ret' in elem['jmp']['attributes'][0]['strattr']:
				data[i] = {'halt': {'attributes': [], 'exp': {'inte': {'int': '1', 'typ': {'reg': 1}}}}}
				return

	raise "Ret Not Found"

def max(addr1,addr2):
	if addr1 < addr2:
		return addr2
	else:
		return addr1

def get_max_address(data):
	"""
	Get the maxium address of the program
	"""
	max_address = 0
	for elem in data:
		if is_instruction(elem):
			(address,asm) = get_asm(elem)
			max_address = max(address,max_address) 

	return max_address

def rebase_function(function,rebase):
	"""
	Rebase all addresses from a functionn
	"""
	for elem in function:
		if is_instruction(elem):
			address = elem['label_stmt']['label']['addr']
			elem['label_stmt']['label']['addr'] = address + rebase

		if is_label(elem):
			label = elem['label_stmt']['label']['name']
			new_label = "pc_0x%x" % (int(label[3:],16)+rebase)
			elem['label_stmt']['label']['name'] = new_label


def main():

	json_data = simplejson.load(file('main3.json','r'))
	calles =  get_calls_address(json_data)

	for call in calles:
		if len(calles[call]) == 1:
			fix_single_function(calles[call][0]+5,call,json_data)
		else:
			function = copy.deepcopy(get_function(call,json_data))
			fix_single_function(calles[call][0]+5,call,json_data)
			max_address = get_max_address(json_data)
			for source in calles[call][1:]:
				new_function = copy.deepcopy(function)
				rebase_function(new_function,0x1000) # Might need to change
				fix_single_function(source+5,call+0x1000,new_function)
				fix_call(call+0x1000,source,json_data)
				json_data += new_function
		
	fix_final_ret(json_data)
	print dumper.json_to_il(json_data)

if __name__ == '__main__':
	main()

