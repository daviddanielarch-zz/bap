"""
This module takes a json file with BAP IL representation and does the inlining 
of all the call instructions, enabling interprocedural verifications on BAP.
"""
import simplejson
import pprint
import dumper
import copy
from elftools.elf.descriptions import describe_reloc_type
from elftools.common.py3compat import (
        ifilter, byte2int, bytes2str, itervalues, str2bytes)
from elftools.elf.elffile import ELFFile
from elftools.elf.relocation import RelocationSection
from elftools.elf.descriptions import describe_reloc_type
import sys

def inline_calls(data, json_data, call_number, relocations):
	calls = get_calls_address_list(data)
	result = data
	#print 'Printing calls'
	#print calls
	if not calls:
		return data 
	else:
		for call in calls:
			(index , source, dest) = call
			if dest in relocations:
				new_label = '%s_%d' % (relocations[dest], call_number)
				new_ret_label = 'ret_%s_%d' % (relocations[dest], call_number)
				function_path = 'bap/asm/%s.json' % relocations[dest]
				try:
					new_function = simplejson.loads(open(function_path).read())
				except:
					new_function = [{u'jmp': {u'attributes': [], u'exp': {u'lab': new_ret_label}}}]
				data.insert(len(data)-1,{u'jmp': {u'attributes': [], u'exp': {u'lab': 'where to jump will go here'}}})
				data.insert(len(data)-1, {u'label_stmt': {u'attributes': [], u'label': {u'name': new_ret_label }}})
				index = index + 1
				fix_copy_function(new_function,new_label,new_ret_label)
			else: 
				new_label = 'call_%d' % call_number
				new_function = copy.deepcopy(get_function(dest,json_data))
				fix_copy_function(new_function,new_label,source)
				
			#pprint.pprint(new_function)
			fix_call(new_label,index, data)
			#pprint.pprint(data)				
			call_number += 1			
			result += inline_calls(new_function, json_data, call_number+1, relocations)
	return result

def get_main(data):
	main = []
	for i, elem in enumerate(data):
		if is_ret(elem):
			elem = {'halt': {'attributes': [], 'exp': {'inte': {'int': '1', 'typ': {'reg': 1}}}}}
			main.append(elem)
			#move = {'move': {'attributes': [],
			#         	  'exp': {'var': {'id': 7, 'name': 'T_ra', 'typ': {'reg': 32}}},
			#           	  'var': {'id': 79, 'name': 'ret_address_0', 'typ': {'reg': 32}}
			#		}
			#	}
			#main.insert(len(main)-2,move)
			return main
		else:
			main.append(elem)


def get_relocations(fd):
	""" 
	Return a dict with the relocations contained in a file
	"""
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

def get_calls_address_list(data):
	"""
	Returns a dict with subfunctions addresses as keys and 
	call places as values
	"""
	calls = []
	for i, elem in enumerate(data):
		if is_instruction(elem):
			(address,asm) = get_asm(elem)
			if 'call' in asm:
				dest = int(asm.split()[1],16)
				calls.append((i, address, dest))
		if is_label(elem):
			attrs = elem['label_stmt']['attributes']
			name = elem['label_stmt']['label']['name']
			if attrs:
				asm = elem['label_stmt']['attributes'][0]['asm']
				if 'call' in asm:
					dest = int(asm.split()[1],16)
					calls.append((i, name, dest))
			
	return calls


def fix_call(label, index, data):
	"""
	Replace the jmp address from @call_addres with @new_jmp_address
	"""
	for i,elem in enumerate(data[index:]):
		if is_jmp(elem):
			data[i+index] = {u'jmp': {u'attributes': [], u'exp': {u'lab': '"%s"' % label}}}
			data[i+index]['jmp']['attributes'] = [{'strattr': 'fixed'}]
			return
			#if 'call' in elem['jmp']['attributes'][0]['strattr']:
			#	elem['jmp']['exp'] =  {'inte': {'int': new_jmp_address, 'typ': {'reg': 32}}}
			#	#elem['jmp']['attributes'] = [{'strattr': 'fixed'}]
			#	return

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

def is_cjmp(elem):
	if 'cjmp' in elem:
		return True
	return False
	
def is_jmp(elem):
	"""
	Check if the element is a jmp
	"""
	if 'jmp' in elem.keys():
		return True
	else:
		return False

def is_ret(elem):
	try:
		if 'ret' in elem['jmp']['attributes'][0]['strattr']:
			return True
	except:
		pass

	return False

def is_instruction(elem):
	"""
	Check whetever the passed element is an instruction.
	"""
	if 'label_stmt' in elem.keys():
		addr = elem['label_stmt']['label'].get('addr', None)
		if addr:
			return True
	return False

def is_label(elem):
	"""
	Check whetever the passed element is a label.
	"""
	if 'label_stmt' in elem.keys():
		name = elem['label_stmt']['label'].get('name', None)
		if name:
			return True
	return False
def is_move(elem):
	if 'move' in elem:
		return True
	return False

def fix_final_ret(data):
	"""
	Replaces the last ret of the program with a halt instruction
	This is needed in order to be able to use topredicate
	"""
	for i,elem in enumerate(data):
		if is_jmp(elem):
			if elem['jmp']['attributes']:
				data[i] = {'halt': {'attributes': [], 'exp': {'inte': {'int': '1', 'typ': {'reg': 1}}}}}
				return

	raise "Ret Not Found"

def fix_copy_function(function,call_label,ret_address):
	"""
	Fix a duplicate function
	"""
	for i,elem in enumerate(function):
		if is_jmp(elem):
			if 'lab' in elem['jmp']['exp']:
				old_label = elem['jmp']['exp']['lab']
				if 'ret' not in old_label:
					elem['jmp']['exp'] = {u'lab': '%s_%s' % (call_label , old_label) }

		if is_instruction(elem):
			(address,asm) = get_asm(elem)

		if is_label(elem):
			label = elem['label_stmt']['label']['name']
			elem['label_stmt']['label']['name'] = "%s_%s" % (call_label,label)
			elem['label_stmt']['attributes'].append({'asm':asm})
			elem['label_stmt']['attributes'].append(({'strattr': 'fixed'}))
		if is_cjmp(elem):
			label_true = elem['cjmp']['iftrue']['lab']
			label_false = elem['cjmp']['iffalse']['lab']
			elem['cjmp']['iftrue']['lab'] = '%s_%s' % (call_label, label_true)
			elem['cjmp']['iffalse']['lab'] = '%s_%s' % (call_label, label_false)

		if is_ret(elem):
			if 'ret' in elem['jmp']['attributes'][0]['strattr']:
				if type(ret_address) == type(''):
					if 'ret' in ret_address:
						elem['jmp']['exp'] = {u'lab': '"%s"' % ret_address}
						elem['jmp']['attributes'] = [{'strattr': 'fixed'}]
					else:
						label = ret_address.split('_')
						label[3] = '0x%x' % (int(ret_address.split('_')[3],16) + 5)
						new_label = '_'.join(label)
						elem['jmp']['exp'] = {u'lab': '"%s"' % new_label}
						elem['jmp']['attributes'] = [{'strattr': 'fixed'}]
				else:
					elem['jmp']['exp'] =  {'inte': {'int': str(ret_address+5), 'typ': {'reg': 32}}}
					elem['jmp']['attributes'] = [{'strattr': 'fixed'}]

	for i,elem in enumerate(function):
		if is_instruction(elem):
			function.pop(i)

	function.insert(0,{u'label_stmt': {u'attributes': [], u'label': {u'name': call_label }}})

def is_indirect_jump(elem):
	if 'jmp' in elem.keys():
		if 'load' in elem['jmp']['exp'].keys():
			return True
	return False

def fix_relocations(data,relocations):
	for i,elem in enumerate(data):
		if is_indirect_jump(elem):
			address = int(elem['jmp']['exp']['load']['address']['inte']['int'])
			label = relocations[address]
			(_,asm) = get_asm(data[i-2])
			addr = int(asm.split('*')[1],16)
			data[i-1]['label_stmt']['attributes'] = [{'asm': "call   0x%x" % addr}]
			data[i] = {"jmp":{"exp":{"var":{"name":"T_ra","id":81,"typ":{"reg":32}}},"attributes":[{"strattr":"ret"}]}}

def check_stack_overflow(data):
	ret_count = 0
	for i,elem in enumerate(data):
		if is_move(elem):
			if elem['move']['var']['name'] == 'T_ra':
				elem['move']['var']['name'] = 'ret_address_%d' % ret_count
def usage():
	print "Usage:"
	print "\t parse.py binary_file il_json_file"
	sys.exit(1)

def main():
	if len(sys.argv) < 3:
		usage()
	call_number = 1

	binary_file = sys.argv[1]
	il_json_file = sys.argv[2]
	json_data = simplejson.load(file(il_json_file,'r'))
	relocations = get_relocations(file(binary_file,'rb'))
	fix_relocations(json_data,relocations)
	#pprint.pprint(json_data)
	main = get_main(json_data)

	new_il = inline_calls(main, json_data, 0, relocations)
	check_stack_overflow(new_il)
	print "/*entry node*/\n" + dumper.json_to_il(new_il)


if __name__ == '__main__':
	main()

