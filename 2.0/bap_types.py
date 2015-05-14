endianess = {0 : 'e_little', 1 : 'e_big'}

binop_types = {}
binop_types['plus'] = '+'
binop_types['minus'] = '-'
binop_types['times'] = '*'
binop_types['divide'] = '/'
binop_types['sdivide'] = '$/'
binop_types['modbop'] = '%'
binop_types['smod'] = '$%'
binop_types['lshift'] = '<<'
binop_types['rshift'] = '>>'
binop_types['arshift'] = '$>>'
binop_types['andbop'] = '&'
binop_types['orbop'] = '|'
binop_types['xor'] = '^'
binop_types['eq'] = '=='
binop_types['neq'] = '<>'
binop_types['lt'] = '<'
binop_types['le'] = '<='
binop_types['slt'] = '$<'
binop_types['sle'] = '$<='

unop_types = {}
unop_types['neg'] = '-'
unop_types['not'] = '~'

cast_types = {}
cast_types['cast_unsigned'] = 'pad'
cast_types['cast_signed'] = 'extend'
cast_types['cast_high'] = 'high'
cast_types['cast_low'] = 'low'

class Type(object):
    pass
    
class BasicType(Type):
    pass
    
class LabelType(Type):
    pass
    
class AddrLabel(LabelType):
    def __init__(self, addr=None):
        self.addr = addr
    
    def __repr__(self):
        return 'addr 0x%x'% self.addr
        
class StrLabel(LabelType):
    def __init__(self, name=None):
        self.name = name
    
    def __repr__(self):
        return 'label {0}'.format(str(self.name))
        
class Register(BasicType):
    def __init__(self, bits=None):
        self.bits = bits
    
    def __repr__(self):
        if self.bits == 1:
            return 'bool'
        else:
            return 'u{0}'.format(str(self.bits))

class TMem(BasicType):
    def __init__(self, index_type=None):
        self.index_type = index_type
    
    def __repr__(self):
        return '?u{0}'.format(str(self.index_type))
