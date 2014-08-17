import sys
sys.path.append('..')

from parse_types import *
from bap_exp import *

def parse_expression(json_exp):
    exp = json_exp.keys()[0]
    data = json_exp[exp]
    expression = expression_parse_functions[exp](data)
    return expression
                
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
    
def parse_ite(data):
    condition = parse_expression(data['condition'])
    iftrue = parse_expression(data['iftrue'])
    iffalse = parse_expression(data['iffalse'])
    return Ite(condition, iftrue, iffalse)
    
def parse_binop(data):
    lexp = parse_expression(data['lexp'])    
    rexp = parse_expression(data['rexp'])
    binop_type = data['binop_type']
    return BinOp(binop_type, lexp, rexp)

def parse_unop(data):
    exp = parse_expression(data['exp'])
    unop_type = data['unop_type']
    return UnOp(unop_type, exp)
    
def parse_cast(data):
    cast_type = data['cast_type']
    new_type = parse_basic_type(data['new_type'])
    exp = parse_expression(data['exp'])
    return Cast(cast_type, new_type, exp)

def parse_unknown(data):
    string = data['string']
    typ = parse_basic_type(data['typ'])        
    return Unknown(string, typ) 
    
def parse_ite(data):
    condition = parse_expression(data['condition'])
    iftrue = parse_expression(data['iftrue'])
    iffalse = parse_expression(data['iffalse'])
    return Ite(condition, iftrue, iffalse)
    
def parse_extract(data):
    hbit = data['hbit'] 
    lbit = data['lbit']
    exp = parse_expression(data['exp'])        
    return Extract(hbit, lbit, exp)
    
def parse_concat(data):
    le = parse_expression(data['le'])
    re = parse_expression(data['re'])
    return Concat(le, re)

def parse_let(data):
    var = parse_variable(data['var'])
    e1 = parse_expression(data['e1'])
    e2 = parse_expression(data['e2'])
    return Let(var, e1, e2)

def parse_lab(data): 
    return Lab(data)        
    
expression_parse_functions = {}
expression_parse_functions['var'] = parse_var
expression_parse_functions['load'] = parse_load
expression_parse_functions['store'] = parse_store
expression_parse_functions['binop'] = parse_binop
expression_parse_functions['unop'] = parse_unop
expression_parse_functions['lab'] = parse_lab
expression_parse_functions['inte'] = parse_int
expression_parse_functions['cast'] = parse_cast
expression_parse_functions['ite'] = parse_ite
expression_parse_functions['extract'] = parse_extract
expression_parse_functions['concat'] = parse_concat
expression_parse_functions['let'] = parse_let
expression_parse_functions['unknown'] = parse_unknown
