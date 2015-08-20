import sys
sys.path.append('..')

from bap_types import *

def parse_basic_type(data):
    if data.keys()[0] == 'reg':
        return Register(data['reg']) 
    else:
        if 'element_type' in data['tmem']:
            return TMem(data['tmem']['index_type']['reg'],
                        data['tmem']['element_type']['reg']
                        )
        else:                
            return TMem(data['tmem']['index_type']['reg'])
            
def parse_label_type(data):
    if data.keys()[0] == 'name':
        return StrLabel(data['name'])
    else:
        return AddrLabel(data['addr'])
