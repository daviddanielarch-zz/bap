import simplejson
import pprint
import dumper

data = simplejson.load(file('main2.json','r'))
#pprint.pprint(data)

def get_calls_address(data):
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
#				calls.append((address,int(asm.split()[1],16)))
	return calls




def fix_single_function(ret_address,call_address,data):
	#print "Fixing function at address 0x%x with ret address 0x%x" % (call_address,ret_address)
	start_found = False
	
	for elem in data:

		if is_instruction(elem):
			(address,asm) = get_asm(elem)
			#print "%x %s" % (address,asm)
			if address == call_address:
				start_found = True
				#print "Start found"

		if is_jmp(elem) and start_found:
			#print elem
			if 'ret' in elem['jmp']['attributes'][0]['strattr']:
				elem['jmp']['exp'] =  {'inte': {'int': str(ret_address), 'typ': {'reg': 32}}}
				elem['jmp']['attributes'] = [{'strattr': 'fixed'}]
				return

	raise "Bad start address"

def get_function(call_address,data):
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
				function.append(elem)
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

def fix_final_ret(data):
	for i,elem in enumerate(data):
		if is_jmp(elem):
			#print elem
			if 'ret' in elem['jmp']['attributes'][0]['strattr']:
				data[i] = {'halt': {'attributes': [], 'exp': {'inte': {'int': '1', 'typ': {'reg': 1}}}}}
				return

	raise "Ret Not Found"


calles =  get_calls_address(data)
#print calles
for call in calles:
	if len(calles[call]) ==1:
		fix_single_function(calles[call][0]+5,call,data)

fix_final_ret(data)

#pprint.pprint(fix_single_function(calles[4198400][0]+4,4198400,data))
print dumper.json_to_il(data)


