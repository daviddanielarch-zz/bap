"""
type stmt =
|	Move of (var * exp * attrs)	(*	Assign the value on the right to the var on the left	*)
|	Jmp of (exp * attrs)	(*	Jump to a label/address	*)
|	CJmp of (exp * exp * exp * attrs)	(*	Conditional jump. If e1 is true, jumps to e2, otherwise jumps to e3	*)
|	Label of (Type.label * attrs)	(*	A label we can jump to	*)
|	Halt of (exp * attrs)
|	Assert of (exp * attrs)
|	Assume of (exp * attrs)
|	Comment of (string * attrs)	(*	A comment to be ignored	*)
|	Special of (string * Var.defuse option * attrs)	(*	A "special" statement. (does magic)
"""

from bap_exp import *
from bap_types import *

class Statement(object):
    pass
    
class Move(Statement):
    def __init__(self,  var=None, exp=None, attrs=None):
        self.var = var
        self.exp = exp
        self.attrs = attrs

    def __repr__(self):
        return '{0} = {1}'.format(self.var, self.exp)
        
class Jmp(Statement):
    def __init__(self, exp=None, attrs=None):
        self.exp = exp
        self.attrs = attrs

    def __repr__(self):
        return 'jmp {0}'.format(self.exp)
        
class CJmp(Statement):
    def __init__(self,  cond = None, iftrue=None, iffalse=None, attrs=None):
        self.cond = cond
        self.iftrue = var
        self.iffalse = exp
        self.attrs = attrs

    def __repr__(self):
        return 'cjmp {0}, {1}, {2}'.format(self.cond, 
                                            self.iftrue, 
                                            self.iffalse)

class Label(Statement):
    def __init__(self,  label = None, attrs=None):
        """
        @label: LabelType
        @attrs: 
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
        @label: Exp type.
        @attrs: 
        """
        self.exp = exp
        self.attrs = attrs

    def __repr__(self):
        return 'halt {0}'.format(self.exp)
        
class Assert(Statement):
    def __init__(self,  exp=None, attrs=None):
        """
        @label: Exp type.
        @attrs: 
        """
        self.exp = exp
        self.attrs = attrs

    def __repr__(self):
        return 'assert {0}'.format(self.exp)
        

