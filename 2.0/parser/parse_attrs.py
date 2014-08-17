
def parse_attrs(data):
    attr_to_str = lambda x: attributes_parse_functions[x.keys()[0]](x)
    str_data = map(attr_to_str,data)
    return " ".join(str_data)
         
def parse_asm_attr(data):
    return '@asm "{0}"'.format(data['asm'])

def parse_address_attr(data):
    return "IMPLEMENT ME"

def parse_str_attr(data):
    return '@str "{0}"'.format(data['strattr'])
         
attributes_parse_functions = {}
attributes_parse_functions['asm'] = parse_asm_attr
attributes_parse_functions['address'] = parse_address_attr
attributes_parse_functions['strattr'] = parse_str_attr
