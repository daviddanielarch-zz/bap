class Attr(object):
    pass

def parse_attrs(data):
    parse_attr = lambda x: attributes_parse_functions[x.keys()[0]](x)
    return AttrList(map(parse_attr,data))

class AttrList(Attr):
    def __init__(self, attrs):
        self.attrs = attrs

    def append(self, attr):
        self.attrs.append(attr)
                
    def __repr__(self):
        return "\n  ".join(map(str,self.attrs))
                
    def __iter__(self):
        return iter(self.attrs)                            
        
class Asm(Attr):
    def __init__(self, asm=None):
        self.asm = asm
        
    def __repr__(self):
        return '@asm "{0}"'.format(self.asm)                 

class Address(Attr):
    def __init__(self, address=None):
        self.address = address
        
    def __repr__(self):
        return '@address "0x%x"' % self.address

class StrAttr(Attr):
    def __init__(self, string=None):
        self.string = string
        
    def __repr__(self):
        return '@str "{0}"'.format(self.string)

class Liveout(Attr):
    def __init__(self):
        pass
        
    def __repr__(self):
        return '@set "liveout"'

class Thread(Attr):
    def __init__(self, thread_id=None):
        self.thread_id = thread_id
        
    def __repr__(self):
        return '@tid "{0}"'.format(self.thread_id)

class Synthetic(Attr):
    def __init__(self):
        pass
        
    def __repr__(self):
        return '@set "synthetic"'
                                                
def parse_asm_attr(data):
    return Asm(data['asm'])

def parse_address_attr(data):
    return Address(data['address'])

def parse_str_attr(data):
    return StrAttr(data['strattr'])
         
def parse_liveout_attr(data):
    return Liveout()
                  
def parse_thread_attr(data):
    return Thread(data['thread_id'])

def parse_synthetic_attr(data):
    return Synthetic()

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
