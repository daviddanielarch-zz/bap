
def parse_attrs(data):
    attr_to_str = lambda x: attributes_parse_functions[x.keys()[0]](x)
    str_data = map(attr_to_str,data)
    return "\n  ".join(str_data)
         
def parse_asm_attr(data):
    return '@asm "{0}"'.format(data['asm'])

def parse_address_attr(data):
    return '@address "0x%x"' % data['address']

def parse_str_attr(data):
    return '@str "{0}"'.format(data['strattr'])
         
def parse_liveout_attr(data):
    return '@set "liveout"'
                  
def parse_thread_attr(data):
    return '@tid "{0}"'.format(data['thread_id'])

def parse_synthetic_attr(data):
    return '@set "synthetic"'

def parse_context_attr(data):
    data = data['context']
    operand = data['operand_info_specific']
    usage = data['operand_usage']
    bits = data['bit_length']
    value = int(data['value'])
    taint_info = data['taint_info']
    
    if 'no_taint' in taint_info.keys():
        taint_id = 0
    elif 'taint_multiple' in taint_info.keys():
        taint_id = -1
    else:
        taint_id = taint_info['taint_id']
    
    if 'mem_operand' in operand:
        final_operand = "mem[0x%x]" % operand['mem_operand']['address']
    else:
        final_operand = operand['reg_operand']['name']
    print usage    
    if usage['read'] and usage['written']:
        final_usage = 'rw'
    elif usage['read']:
        final_usage = 'rd'
    else:
        final_usage = 'wr'            
    
    return '@context "%s" = 0x%x, %d, u%d, %s' % (final_operand,
                                                  value,
                                                  taint_id,
                                                  bits,
                                                  final_usage)
                              
attributes_parse_functions = {}
attributes_parse_functions['asm'] = parse_asm_attr
attributes_parse_functions['address'] = parse_address_attr
attributes_parse_functions['strattr'] = parse_str_attr
attributes_parse_functions['thread_id'] = parse_thread_attr
attributes_parse_functions['liveout'] = parse_liveout_attr
attributes_parse_functions['context'] = parse_context_attr
attributes_parse_functions['synthetic'] = parse_synthetic_attr
