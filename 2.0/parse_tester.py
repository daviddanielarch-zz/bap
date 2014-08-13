from bap_parse import *
    
var_tmem = {u'typ': {u'tmem': {u'index_type': {u'reg': 32}}}, u'name': u'mem', u'id': 56}
var_reg = {u'typ': {u'reg': 32}, u'name': u'R_EBP', u'id': 0}

label_stmt_name = {u'label_stmt': {u'attributes': [], u'label': {u'name': u'pc_0x804840d'}}}
label_stmt_addr = {u'label_stmt': {u'attributes': [{u'asm': u'push   %ebp'}], u'label': {u'addr': 134513676}}}


# Checking variable parsing
assert(str(parse_var(var_tmem)) == "mem:u32")
assert(str(parse_var(var_reg)) == "R_EBP:u32")

# Checking statements
assert(str(parse_statement(label_stmt_name)) == "label pc_0x804840d")
assert(str(parse_statement(label_stmt_addr)) == 'addr 0x804840c @asm "push   %ebp"')


