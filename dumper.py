import simplejson
symbol = {}
symbol['minus'] = '-'
symbol['plus'] = '+'
symbol['lt'] = '<'
symbol['eq'] = '=='
symbol['andbop'] = '&'
symbol['xor'] = '^'
symbol['rshift'] = '>>'
symbol['unop'] = '~'

cast = {}
cast['cast_low'] = 'low'
cast['cast_high'] = 'high'

def json_to_il(data):
	il_text = ""
	for elem in data:
		il_text += convert_to_text(elem) + '\n'
	return il_text

def convert_to_text(elem):
	cmd = elem.keys()[0]
	if cmd == 'label_stmt' :
		return label_stmt_to_text(elem)
	elif cmd == 'move':
		return move_to_text(elem)
	elif cmd == 'jmp':
		return jmp_to_text(elem)
	elif cmd == 'halt':
		return halt_to_text(elem)

def label_stmt_to_text(elem):
	attrs = elem['label_stmt']['attributes'] 
	if attrs:
		asm = attrs[0]['asm']
		address = elem['label_stmt']['label']['addr']
		return 'addr 0x%x @asm "%s" ' % (address,asm)		
	else:
		name = elem['label_stmt']['label']['name']
		return 'label %s' % name

def jmp_to_text(elem):
	strattr = elem['jmp']['attributes'][0]['strattr']
	return 'jmp %s @str "%s"' % (get_exp(elem['jmp']['exp']),strattr)

def halt_to_text(elem):
	return "halt true"		

def get_var(var):
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

def move_to_text(elem):
	var = get_var(elem['move']['var'])
	exp_val = get_exp(elem['move']['exp'])
	return "%s = %s" % (var,exp_val)

def get_exp(exp):
	if 'var' in exp:
		return get_var(exp['var'])

	if 'inte' in exp:
		value = int(exp['inte']['int'])
		typ = exp['inte']['typ']['reg']
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
		return "%s:%s(%s)" % (cast[cast_type],typ,get_exp(exp['cast']['exp']))

	if 'unop' in exp:
		return "~%s" % get_exp(exp['unop']['exp'])
		
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

	#print exp

data = simplejson.load(file('main2.json','r'))
#print json_to_il(data)
#print "\n".join(json_to_il(data).split('\n')[:34])


