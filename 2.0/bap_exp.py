from bap_types import *

class Exp(object):
    pass
    
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

            
class Int(Exp):
    def __init__(self, number=None, typ=None):
        self.inte = int(number)
        self.typ = typ

    def __repr__(self):
        if str(self.typ) == 'bool':
            if self.inte == 0:
                return 'false'
            else:
                return 'true'
                
        if self.inte < 0xa:
            return '{0}:{1}'.format(self.inte, self.typ)
        else:
            return '0x%x:%s' % (self.inte, self.typ)
                               
                 
var_type = type(Variable())
int_type = type(Int(0))

class BinOp(Exp):
    def __init__(self, binop_type=None, lexp=None,  rexp=None):
        self.binop_type = binop_type
        self.lexp = lexp
        self.rexp = rexp
        
    def __repr__(self):
        if type(self.lexp) in [var_type, int_type]:
            final_lexp = '{0}'.format(self.lexp)
        else:
            final_lexp = '({0})'.format(self.lexp)
        if type(self.rexp) in [var_type, int_type]:
            final_rexp = '{0}'.format(self.rexp)
        else:
            final_rexp = '({0})'.format(self.rexp)
                        
        return '{0} {1} {2}'.format(final_lexp,
                                    binop_types[self.binop_type], 
                                    final_rexp)
class Cast(Exp):
    def __init__(self, cast_type=None, new_type=None, exp=None):
        self.cast_type = cast_type
        self.new_type = new_type
        self.exp = exp
        
    def __repr__(self):
        return '{0}:{1}({2})'.format(cast_types[self.cast_type],
                                     self.new_type, 
                                     self.exp)
                                                 
class UnOp(Exp):
    def __init__(self, unop_type=None, exp=None):
        self.unop_type = unop_type
        self.exp = exp
        
    def __repr__(self):
        return '{0}({1})'.format(unop_types[self.unop_type], 
                                 self.exp)
                                                 
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
                                                                                              
class Unknown(Exp):
    def __init__(self, string=None, typ=None):
        self.string = string
        self.typ = typ
        
    def __repr__(self):
        return 'unknown "{0}":{1}'.format(self.string, 
                                        self.typ)
class Ite(Exp):
    def __init__(self, condition=None, iftrue=None, iffalse=None):
        self.condition = condition
        self.iftrue = iftrue
        self.iffalse = iffalse
        
    def __repr__(self):
        return 'if {0} then {1} else {2}'.format(self.condition, 
                                                self.iftrue, 
                                                self.iffalse)
                                                
class Lab(Exp):
    def __init__(self, string):
        self.string = string
        
    def __repr__(self):
        return '"{0}"'.format(self.string)                                                

class Extract(Exp):
    def __init__(self, hbit=None, lbit=None, exp=None):
        self.hbit = hbit
        self.lbit = lbit
        self.exp = exp
        
    def __repr__(self):
        return 'extract:{0}:{1}:[{2}]'.format(self.hbit,
                                              self.lbit,
                                              self.exp)        

class Concat(Exp):
    def __init__(self, le=None, re=None):
        self.le = le
        self.re = re
        
    def __repr__(self):
        return 'concat:[{0}][{1}]'.format(self.le,
                                          self.re)        
                                          
class Let(Exp):
    def __init__(self, var=None, e1=None, e2=None):
        self.var = var
        self.e1 = e1
        self.e2 = e2        
        
    def __repr__(self):
        return 'let "{0}" := {1} in {2}'.format(self.var,
                                                self.e1,
                                                self.e2)                                                                                      
            
