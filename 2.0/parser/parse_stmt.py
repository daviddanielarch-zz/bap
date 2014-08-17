import sys
sys.path.append('..')

from parse_exp import *
from parse_types import *
from parse_attrs import *

from bap_stmt import *

def parse_statement(json_stmt):
    stmt = json_stmt.keys()[0]
    data = json_stmt[stmt]
    statement = statement_parse_functions[stmt](data)
    return statement
    
def parse_stmt_jmp(data):
    exp = parse_expression(data['exp'])
    attrs = parse_attrs(data['attributes'])
    return Jmp(exp, attrs)
               
def parse_stmt_comment(data):    
    string = data['string']
    attributes = parse_attrs(data['attributes'])
    return Comment(string, attributes)

def parse_stmt_halt(data):
    exp = parse_expression(data['exp'])
    attributes = parse_attrs(data['attributes'])
    return Halt(exp, attributes)    

def parse_stmt_assert(data):
    exp = parse_expression(data['exp'])
    attributes = parse_attrs(data['attributes'])
    return Assert(exp, attributes)    

def parse_stmt_cjmp(data):
    cond = parse_expression(data['cond'])
    attrs = parse_attrs(data['attributes'])
    iffalse = parse_expression(data['iffalse'])
    iftrue = parse_expression(data['iftrue'])
    return CJmp(cond, iftrue, iffalse, attrs)

def parse_stmt_special(data):
    string = data['string']
    attrs = parse_attributes(data['attributes'])
    return Special(string, attrs)

def parse_stmt_move(data):
    attrs = parse_attrs(data['attributes'])    
    exp = parse_expression(data['exp'])
    var = parse_var(data['var'])
    return Move(var, exp, attrs)
    
def parse_stmt_label(data):
    label = parse_label_type(data['label'])
    attrs = parse_attrs(data['attributes'])
    return Label(label, attrs)
    
statement_parse_functions = {}
statement_parse_functions['move'] = parse_stmt_move
statement_parse_functions['cjmp'] = parse_stmt_cjmp
statement_parse_functions['jmp'] = parse_stmt_jmp
statement_parse_functions['label_stmt'] = parse_stmt_label
statement_parse_functions['halt'] = parse_stmt_halt
statement_parse_functions['assert_stmt'] = parse_stmt_assert
statement_parse_functions['comment'] = parse_stmt_comment
statement_parse_functions['special'] = parse_stmt_special
