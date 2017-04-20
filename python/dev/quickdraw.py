#!/bin/env python

############################################################################
#
#
# histogram maker from a TTRee using TTree::Draw
#
#
############################################################################

import ROOT
import sys
from histfactory import *

def help():
    print "HELP - Usage"
    print ""
    print "   python %s INPUTROOTFILE INPUTTTREE SAMPLELABEL OUTPUTROOTFILE VARXNAME VARXEXPR NBINX XMIN XMAX [CUT LABEL [VARYNAME VARYEXPR NBINY YMIN YMAX]]" % ( sys.argv[0] )
    print ""
    print "   NOTE: please make sure the nbin, min, max values can be converted to int, float"
    print ""
    sys.exit(-1)

#
# check the number of arguments
#
if len( sys.argv ) != 17 and len( sys.argv ) != 12 and len( sys.argv ) != 11 and len( sys.argv ) != 10:
    help()

#
# parse arguments
#
try:
    rootfilename = str   ( sys.argv[1]  )
    ttreename    = str   ( sys.argv[2]  )
    samplelabel  = str   ( sys.argv[3]  )
    ofilename    = str   ( sys.argv[4]  )
    varxname     = str   ( sys.argv[5]  )
    varxexpr     = str   ( sys.argv[6]  )
    nbinx        = int   ( sys.argv[7]  )
    xmin         = float ( sys.argv[8]  )
    xmax         = float ( sys.argv[9]  )
    if len( sys.argv ) == 11:
        cuts         = str   (sys.argv[10] )
        label        = ""
        varyname     = "NOYVAR"
        varyexpr     = ""
        nbiny        = 0
        ymin         = 0.
        ymax         = 0.
    elif len( sys.argv ) == 12:
        cuts         = str   ( sys.argv[10] )
        label        = str   ( sys.argv[11] )
        varyname     = "NOYVAR"
        varyexpr     = ""
        nbiny        = 0
        ymin         = 0.
        ymax         = 0.
    elif len( sys.argv ) == 17:
        cuts         = str   ( sys.argv[10] )
        label        = str   ( sys.argv[11] )
        varyname     = str   ( sys.argv[12] )
        varyexpr     = str   ( sys.argv[13] )
        nbiny        = int   ( sys.argv[14] )
        ymin         = float ( sys.argv[15] )
        ymax         = float ( sys.argv[16] )
    else:
        cuts         = "1."
        label        = ""
        varyname     = "NOYVAR"
        varyexpr     = ""
        nbiny        = 0
        ymin         = 0.
        ymax         = 0.
except:
    help()

print cuts

hf = HistFactory( samplelabel, rootfilename, ttreename, ofilename, True )
hf.draw( varxname, varxexpr, nbinx, xmin, xmax, cuts, label, varyname, varyexpr, nbiny, ymin, ymax )
