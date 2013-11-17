"""
This module takes a json file exported by using the toil -json utility on BAP
and returns a valid BAP IL file.
"""
import pprint
import simplejson
symbol = {}
symbol['minus'] = '-'
symbol['plus'] = '+'
symbol['times'] = '*'
symbol['neq'] = '<>'
symbol['lt'] = '<'
symbol['eq'] = '=='
symbol['andbop'] = '&'
symbol['xor'] = '^'
symbol['rshift'] = '>>'
symbol['unop'] = '~'

cast = {}
cast['cast_low'] = 'low'
cast['cast_high'] = 'high'
cast['cast_signed'] = 'extend'

def json_to_il(data):
	il_text = ""
	for elem in data:
		il_text += convert_to_text(elem) + '\n'
	return il_text

def convert_to_text(elem):
	"""
	Converter dispatcher according to the instruction type
	"""
	#print elem
	cmd = elem.keys()[0]
	#print cmd
	#print elem
	if cmd == 'label_stmt' :
		return label_stmt_to_text(elem)
	elif cmd == 'move':
		return move_to_text(elem)
	elif cmd == 'jmp':
		return jmp_to_text(elem)
	elif cmd == 'halt':
		return halt_to_text(elem)
	elif cmd == 'cjmp':
		return cjmp_to_text(elem)
	elif cmd == 'comment':
		return comment_to_text(elem)
	elif cmd == 'assert_stmt':
		return assert_to_text(elem)

	raise "asd"

def assert_to_text(elem):
	return "assert %s" % get_exp(elem['assert_stmt']['exp'])

def comment_to_text(elem):
	return "/* %s */"  % elem['comment']['string']

def cjmp_to_text(elem):
	if 'inte' in elem['cjmp']['iftrue'].keys():
		iftrue_addr = int(elem['cjmp']['iftrue']['inte']['int'])
		iftrue_type = elem['cjmp']['iftrue']['inte']['typ']['reg']
		iftrue = "0x%x:u%d" % (iftrue_addr,iftrue_type)
	else:
		iftrue = '"%s"' % elem['cjmp']['iftrue']['lab']

	if 'inte' in elem['cjmp']['iffalse'].keys():
		iftrue_addr = int(elem['cjmp']['iffalse']['inte']['int'])
		iftrue_type = elem['cjmp']['iffalse']['inte']['typ']['reg']
		iftrue = "0x%x:u%d" % (iffalse_addr,iffalse_type)
	else:
		iffalse = '"%s"' % elem['cjmp']['iffalse']['lab']

	cond = get_exp(elem['cjmp']['cond'])
	return 'cjmp %s, %s , %s' % (cond,iftrue,iffalse)

#cjmp ~(R_SF:bool ^ R_OF:bool), 0x401071:u32, "nocjmp0"
def label_stmt_to_text(elem):
	"""
	Take a label_stmt element and return the text
	""" 
	address = elem['label_stmt']['label'].get('addr',None)
	if address:
		asm = elem['label_stmt']['attributes'][0]['asm']
		return 'addr 0x%x @asm "%s" ' % (address,asm)		
	else:
		name = elem['label_stmt']['label']['name']
		attrs = elem['label_stmt']['attributes']
		if attrs:
			asm = elem['label_stmt']['attributes'][0]['asm']
			return 'label %s @asm "%s" ' % (name, asm)		
		else:
			return 'label %s' % name


def jmp_to_text(elem):
	"""
	Take a jmp element and return the text
	"""
	if elem['jmp']['attributes']:
		strattr = elem['jmp']['attributes'][0]['strattr']
		return 'jmp %s @str "%s"' % (get_exp(elem['jmp']['exp']),strattr)
	else:
		return 'jmp "%s"' % get_exp(elem['jmp']['exp'])


def halt_to_text(elem):
	"""
	Take a halt element and return the text
	"""
	return "halt true"		

def move_to_text(elem):
	"""
	Take a move element and return the text
	"""
	var = get_var(elem['move']['var'])
	exp_val = get_exp(elem['move']['exp'])
	return "%s = %s" % (var,exp_val)

"""
All the expresion are of the form:
	var = expresion
The next functions are in charge of getting the text values of
vars and expressions.
"""

def get_var(var):
	"""
	Get the var value of an element (left assigment part)
	"""
	name = var['name']
	if 'tmem' in var['typ']:
		typ = var['typ']['tmem']['index_type']['reg']
		return "%s:?u%d" % (name,typ) 
	else:
		typ = var['typ']['reg']
		if typ == 1:
			typ = 'bool'
		else:
			typ = 'u%s' % typ
		return "%s:%s" % (name,typ)


def get_exp(exp):
	#pprint.pprint(exp)
	"""
	Get the expresion value of an element (right assigment part)
	"""
	if 'var' in exp:
		return get_var(exp['var'])

	if 'inte' in exp:
		value = int(exp['inte']['int'])
		typ = exp['inte']['typ']['reg']
		if typ == 1:
			if value == 0:
				return 'false'
			else:
				return 'true'
		else:
			if value < 0xa:
				return "%x:u%d" % (value,typ)
			else:
				return "0x%x:u%d" % (value,typ)

	if 'cast' in exp:
		typ = exp['cast']['new_type']['reg']
		cast_type = exp['cast']['cast_type']
		if typ == 1:
			typ = 'bool'
		else:
			typ = 'u%s' % typ
		#print pprint.pprint(exp)
		return "%s:%s(%s)" % (cast[cast_type],typ,get_exp(exp['cast']['exp']))

	if 'unop' in exp:
		if exp['unop']['unop_type'] == 'neg':
			return "-(%s)" % get_exp(exp['unop']['exp'])
		elif exp['unop']['unop_type'] == 'not':
			return "~(%s)" % get_exp(exp['unop']['exp'])
		else:
			raise "New unop_type"
		
	if 'binop' in exp:
		op = exp['binop']['binop_type']
		left = exp['binop']['lexp']
		right = exp['binop']['rexp']
		return "(%s) %s (%s)" % (get_exp(left),symbol[op],get_exp(right))

	if 'store' in exp:
		address = get_exp(exp['store']['address'])
		endian = exp['store']['endian']
		if endian['inte']['typ']['reg'] == 1:
			endian_value = 'e_little'
		else:
			endian_value = 'e_big'
			
		memory = get_exp(exp['store']['memory'])
		typ = exp['store']['typ']['reg']
		value = get_exp(exp['store']['value'])

		return "%s with [%s, %s]:u%d = %s" % (memory,address,endian_value,typ,value)

	if 'load' in exp:
		address = get_exp(exp['load']['address'])
		endian = exp['load']['endian']
		if endian['inte']['typ']['reg'] == 1:
			endian_value = 'e_little'
		else:
			endian_value = 'e_big'
			
		memory = get_exp(exp['load']['memory'])
		typ = exp['load']['typ']['reg']

		return "%s[%s, %s]:u%d" % (memory,address,endian_value,typ)
	if 'lab' in exp:
		return exp['lab']

	if 'unknown' in exp:
		return 'unknown "%s":bool' % exp['unknown']['string']

	if 'ite' in exp:
		#"R_CF:bool = if T_t_87:u32 == 0:u32 then false else true"
		 return "if %s then false else true" % get_exp(exp['ite']['condition'])
	if 'extract' in exp:
		return 'extract:%d:%d:[%s]' % (exp['extract']['hbit'], 
						exp['extract']['lbit'], 
						get_exp(exp['extract']['exp']))

	if 'concat' in exp:
		return "concat:[%s][%s]" % (get_exp(exp['concat']['le']),get_exp(exp['concat']['re']))	
	pprint.pprint(exp)
	#concat:[extract:31:8:[R_EAX:u32]][mem:?u32[R_ESI:u32, e_little]:u8]
	raise "Unknown command"

#def main():
#	data = simplejson.load(file('main.json','r'))
#	#pprint.pprint(data)

#if __name__ == '__main__':
#	main()



