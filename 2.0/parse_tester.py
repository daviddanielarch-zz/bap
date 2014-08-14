from bap_parse import *
    
var_tmem = {u'typ': {u'tmem': {u'index_type': {u'reg': 32}}}, u'name': u'mem', u'id': 56}
var_reg = {u'typ': {u'reg': 32}, u'name': u'R_EBP', u'id': 0}

label_stmt_name = {u'label_stmt': {u'attributes': [], u'label': {u'name': u'pc_0x804840d'}}}
label_stmt_addr = {u'label_stmt': {u'attributes': [{u'asm': u'push   %ebp'}], u'label': {u'addr': 134513676}}}

move_stmt = {u'move': {u'var': {u'typ': {u'reg': 32}, u'name': u'R_EBP', u'id': 78}, u'attributes': [], u'exp': {u'var': {u'typ': {u'reg': 32}, u'name': u'R_ESP', u'id': 0}}}}

int_exp = {u'inte': {u'int': u'0', u'typ': {u'reg': 1}}}

move_stmt_store = {u'move': {u'var': {u'typ': {u'tmem': {u'index_type': {u'reg': 32}}}, u'name': u'mem', u'id': 56}, u'attributes': [], u'exp': {u'store': {u'address': {u'var': {u'typ': {u'reg': 32}, u'name': u'R_ESP', u'id': 1}}, u'typ': {u'reg': 32}, u'endian': {u'inte': {u'int': u'0', u'typ': {u'reg': 1}}}, u'value': {u'var': {u'typ': {u'reg': 32}, u'name': u'T_t', u'id': 78}}, u'memory': {u'var': {u'typ': {u'tmem': {u'index_type': {u'reg': 32}}}, u'name': u'mem', u'id': 56}}}}}}

move_stmt_load = {u'move': {u'var': {u'typ': {u'reg': 32}, u'name': u'R_EAX', u'id': 5}, u'attributes': [], u'exp': {u'load': {u'address': {u'binop': {u'binop_type': u'plus', u'lexp': {u'var': {u'typ': {u'reg': 32}, u'name': u'R_ESP', u'id': 1}}, u'rexp': {u'inte': {u'int': u'28', u'typ': {u'reg': 32}}}}}, u'typ': {u'reg': 32}, u'endian': {u'inte': {u'int': u'0', u'typ': {u'reg': 1}}}, u'memory': {u'var': {u'typ': {u'tmem': {u'index_type': {u'reg': 32}}}, u'name': u'mem', u'id': 56}}}}}}

# Checking variable parsing
assert(str(parse_var(var_tmem)) == "mem:?u32")
assert(str(parse_var(var_reg)) == "R_EBP:u32")

# Checking statements
assert(str(parse_statement(label_stmt_name)) == "label pc_0x804840d")
assert(str(parse_statement(label_stmt_addr)) == 'addr 0x804840c @asm "push   %ebp"')
assert(str(parse_statement(move_stmt)) == 'R_EBP:u32 = R_ESP:u32')
assert(str(parse_statement(move_stmt_store)) == 'mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32')
assert(str(parse_statement(move_stmt_load)) == 'R_EAX:u32 = mem:?u32[R_ESP:u32 + 0x1c:u32, e_little]:u32')

# Checking expressions
assert(str(parse_expression(int_exp)) == '0:bool')

