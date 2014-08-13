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

class Load(Exp):
    def __init__(self, address=None, memory=None, endian=None, typ=None):
        self.address = address
        self.memory = memory
        self.endian = endian
        self.typ = typ
        
    def __repr__(self):
        return '{0}[{1},{2}]:{3}'.format(self.memory, 
                                         self.address, 
                                         self.endian, 
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
        return '{0}[{1},{2}]:{3} = {4}'.format(self.memory, 
                                               self.address, 
                                               self.endian, 
                                               self.typ,
                                               self.value)
        
                
class Int(Exp):
    def __init__(self, number):
        try:
            self.inte = int(number)
        except:
            raise ValueError('The argument must be an integer.')

    def __repr__(self):
        return str(number)
        
