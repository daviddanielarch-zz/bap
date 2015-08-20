from bap_exp import *
from bap_types import *

class Statement(object):
    pass
    
class Move(Statement):
    def __init__(self,  var=None, exp=None, attrs=None):
        """
        @label: Variable
        @exp: Exp
        @attrs: List of atributes get by parse_attrs
        """
        self.var = var
        self.exp = exp
        self.attrs = attrs

    def __repr__(self):
        if self.attrs:
            return '{0} = {1} {2}'.format(self.var, self.exp, self.attrs)
        else:
            return '{0} = {1}'.format(self.var, self.exp)
            
class Jmp(Statement):
    def __init__(self, exp=None, attrs=None):
        """
        @exp: Exp
        @attrs: List of atributes get by parse_attrs
        """    
        self.exp = exp
        self.attrs = attrs

    def __repr__(self):
        if self.attrs:
            return 'jmp {0} {1}'.format(self.exp, self.attrs)
        else:
            return 'jmp {0}'.format(self.exp)
        
class CJmp(Statement):
    def __init__(self,  cond = None, iftrue=None, iffalse=None, attrs=None):
        """
        @cond: Exp
        @iftrue: Exp
        @iffalse: Exp
        @attrs: List of atributes get by parse_attrs
        """    
        self.cond = cond
        self.iftrue = iftrue
        self.iffalse = iffalse
        self.attrs = attrs

    def __repr__(self):
        if self.attrs:
            return 'cjmp {0}, {1}, {2} {3}'.format(self.cond, 
                                                self.iftrue, 
                                                self.iffalse,
                                                self.attrs)
        else:                                            
            return 'cjmp {0}, {1}, {2}'.format(self.cond, 
                                                self.iftrue, 
                                                self.iffalse)

class Label(Statement):
    def __init__(self,  label = None, attrs=None):
        """
        @label: LabelType
        @attrs: List of atributes get by parse_attrs
        """
        self.label = label
        self.attrs = attrs

    def __repr__(self):
        if self.attrs:
            return '{0} {1}'.format(self.label, self.attrs)
        else:
            return '{0}'.format(self.label)
            
class Halt(Statement):
    def __init__(self,  exp=None, attrs=None):
        """
        @label: Exp
        @attrs: List of atributes get by parse_attrs
        """
        self.exp = exp
        self.attrs = attrs

    def __repr__(self):
        if self.attrs:
            return 'halt {0} {1}'.format(self.exp, self.attrs)
        else:
            return 'halt {0}'.format(self.exp)

class Special(Statement):
    def __init__(self,  string=None, attrs=None):
        """
        @string: string
        @attrs: List of atributes get by parse_attrs
        """
        self.string = string
        self.attrs = attrs

    def __repr__(self):
        if self.attrs:
            return 'special "{0}" {1}'.format(self.string, self.attrs)
        else:
            return 'special "{0}"'.format(self.string)
                    
class Assert(Statement):
    def __init__(self,  exp=None, attrs=None):
        """
        @exp: Exp type.
        @attrs: List of atributes get by parse_attrs
        """
        self.exp = exp
        self.attrs = attrs

    def __repr__(self):
        if self.attrs:
            return 'assert {0}'.format(self.exp)
        else:
            return 'assert {0} {1}'.format(self.exp, self.attrs)
            
class Comment(Statement):
    def __init__(self,  string=None, attrs=None):
        """
        @label: string.
        @attrs: List of atributes get by parse_attrs
        """
        self.string = string
        self.attrs = attrs

    def __repr__(self):
        if self.attrs:
            return '/*{0}*/'.format(self.string)
        else:
            return '/*{0}*/ {1}'.format(self.string, self.attrs)            
        

