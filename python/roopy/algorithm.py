#!/usr/bin/env python

#  .
# ..: Philip Chang, University of Illinois at Urbana-Champaign

#_______________________________________________________________________
class algorithm:

    # This is an "algorithm" which will be ran for each event
    # this is only a base class and hence one needs to derive from this

    def __init__(self): pass
    def version(self): pass
    def init(self, tree): pass
    def begin(self): pass
    def process(self): pass
    def terminate(self): pass

#eof
