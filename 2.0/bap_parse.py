
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
    
def parse_store(data):
    address = parse_expression(data['address'])    
    memory = parse_expression(data['memory'])    
    endian = parse_expression(data['endian'])  
    typ = parse_basic_type(data['typ'])
    value = parse_expression(data['value'])    
    return Store(address, memory, endian, typ, value)
    
def parse_load(data):
    address = parse_expression(data['address'])    
    memory = parse_expression(data['memory'])    
    endian = parse_expression(data['endian'])  
    typ = parse_basic_type(data['typ'])
    return Load(address, memory, endian, typ)
        
def parse_int(data):
    number = data['int']
    typ = parse_basic_type(data['typ'])
    return Int(number, typ)
    
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
    data = json_exp[exp]
    expression = expression_parse_functions[exp](data)
    return expression
    
def parse_binop(data):
    lexp = parse_expression(data['lexp'])    
    rexp = parse_expression(data['rexp'])
    binop_type = data['binop_type']
    return BinOp(binop_type, lexp, rexp)
    
def parse_asm_attr(data):
    return '@asm "{0}"'.format(data['asm'])

def parse_address_attr(data):
    return "IMPLEMENT ME"
         
statement_parse_functions = {}
statement_parse_functions['label_stmt'] = parse_stmt_label
statement_parse_functions['move'] = parse_stmt_move

expression_parse_functions = {}
expression_parse_functions['var'] = parse_var
expression_parse_functions['store'] = parse_store
expression_parse_functions['load'] = parse_load
expression_parse_functions['inte'] = parse_int
expression_parse_functions['binop'] = parse_binop

attributes_parse_functions = {}
attributes_parse_functions['asm'] = parse_asm_attr
attributes_parse_functions['address'] = parse_address_attr

    
