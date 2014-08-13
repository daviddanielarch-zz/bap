
from bap_stmt import *

def parse_basic_type(data):
    if data.keys()[0] == 'reg':
        return Register(data['reg']) 
    else:
        return TMem(data['tmem']['index_type']['reg'])

def parse_label_type(data):
    if data.keys()[0] == 'name':
        return StrLabel(data['name'])
    else:
        return AddrLabel(data['addr'])
    
def parse_attrs(data):
    attr_to_str = lambda x: attributes_parse_functions[x.keys()[0]](x)
    str_data = map(attr_to_str,data)
    return " ".join(str_data)
            
def parse_var(data):
    id = data['id']    
    name = data['name']
    typ = parse_basic_type(data['typ'])
    return Variable(id, name, typ)
    
def parse_stmt_move(data):
    attrs = parse_attrs(data['attributes'])    
    exp = parse_expression(data['exp'])
    var = parse_var(data['var'])
    return Move(var, exp, attrs)
    
def parse_stmt_label(data):
    label = parse_label_type(data['label'])
    attrs = parse_attrs(data['attributes'])
    return Label(label, attrs)
        
def parse_statement(json_stmt):
    stmt = json_stmt.keys()[0]
    data = json_stmt[stmt]
    statement = statement_parse_functions[stmt](data)
    return statement
    
def parse_expression(json_exp):
    exp = json_exp.keys()[0]
    data = json_exp[stmt]
    expression = statement_parse_expression[exp](data)
    return expression
    
def parse_asm_attr(data):
    return '@asm "{0}"'.format(data['asm'])

def parse_address_attr(data):
    return "IMPLEMENT ME"
         
statement_parse_functions = {}
statement_parse_functions['label_stmt'] = parse_stmt_label

expression_parse_functions = {}
expression_parse_functions['var'] = parse_var

attributes_parse_functions = {}
attributes_parse_functions['asm'] = parse_asm_attr
attributes_parse_functions['address'] = parse_address_attr

    
