endianess = {0 : 'e_little', 1 : 'e_big'}

binop_types = {}
binop_types['plus'] = '+'
binop_types['minus'] = '-'
binop_types['times'] = '*'
binop_types['divide'] = '/'
binop_types['sdivide'] = '$/'
binop_types['mod'] = '%'
binop_types['smod'] = '$%'
binop_types['lshift'] = '<<'
binop_types['rshift'] = '>>'
binop_types['arshift'] = '$>>'
binop_types['and'] = '&'
binop_types['or'] = '|'
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

class Exp(object):
    pass
    
class BinOp(Exp):
    def __init__(self, binop_type=None, lexp=None,  rexp=None):
        self.binop_type = binop_type
        self.lexp = lexp
        self.rexp = rexp
        
    def __repr__(self):
        return '{0} {1} {2}'.format(self.lexp,
                                    binop_types[self.binop_type], 
                                    self.rexp)
                
class Variable(Exp):
    def __init__(self, id=None, name=None,  typ=None):
        """
        @typ: BasicType type.
        @id: numeric value.
        @name: string.
        """
        self.type = typ
        self.id = id
        self.name = name
        
    def __repr__(self):
        return '{0}:{1}'.format(self.name, self.type)

class Load(Exp):
    def __init__(self, address=None, memory=None, endian=None, typ=None):
        self.address = address
        self.memory = memory
        self.endian = endian
        self.typ = typ
        
    def __repr__(self):
        return '{0}[{1}, {2}]:{3}'.format(self.memory, 
                                         self.address, 
                                         endianess[self.endian.inte],
                                         self.typ)

class Store(Exp):
    def __init__(self, address=None, memory=None, endian=None, typ=None,
                 value=None):
        self.address = address
        self.memory = memory
        self.endian = endian
        self.typ = typ
        self.value = value
        
    def __repr__(self):
        return '{0} with [{1}, {2}]:{3} = {4}'.format(self.memory, 
                                               self.address, 
                                               endianess[self.endian.inte], 
                                               self.typ,
                                               self.value)
            
class Int(Exp):
    def __init__(self, number, typ):
        try:
            self.inte = int(number)
            self.typ = typ
        except:
            raise ValueError('The argument must be an integer.')

    def __repr__(self):
        if self.inte < 0xa:
            return '{0}:{1}'.format(self.inte, self.typ)
        else:
            return '0x%x:%s' % (self.inte, self.typ)
        
