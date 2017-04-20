#!/bin/env python

import glob
import sys
import os

def help():
    print "HELP - Usage"
    print ""
    print "  %s SUBPROCESSPATH PARTICLEIDX:POL [PARTICLEIDX:POL ... ]" % (sys.argv[0])
    print ""
    print "  POL can be one of the following:"
    print "    T: Transverse   (only for boson)"
    print "    L: Longitudinal (only for boson)"
    print "    r: right handed (only for fermion)"
    print "    l: left handed  (only for fermion)"
    print ""
    sys.exit( -1 )

try:
    subprocess_path = sys.argv[1]
except:
    help()


#
# parse options into list of particles and polarizations
#
particles = []
pols = []

# looping over options
for idx in xrange( 2,  len( sys.argv ) ):
    # split by :
    tmp_str_vec = sys.argv[idx].split( ":" )
    # check the option
    # does it have idx, and pol?
    if len( tmp_str_vec ) != 2:
        print "ERROR:",sys.argv[idx], " <== not able to parse"
        help()
    # is the first one an integer?
    try:
        particles.append( int( tmp_str_vec[0] ) )
    except:
        print "ERROR:",tmp_str_vec[0], " <== not able to cast it to int"
        help()
    # is the second one a recognized pol?
    try:
        pol = str( tmp_str_vec[1] )
        if pol not in [ "T", "L", "r", "l" ]:
            print "ERROR:",pol," <== not regonzied polarization type!"
        pols.append( pol )
    except:
        print "ERROR:",tmp_str_vec[1], " <== not able to cast it to str"
        help()

#
# Print parsed options
#
print "===================================================="
for idx, p in enumerate( particles ):
    print p, pols[idx]
print "===================================================="

# this scripts modify the matrix.f to have polarized particles
def rewrite_matrix( matrix_src_file_path, particles, pols ):

    do_backup = False
    try:
        f = open( matrix_src_file_path + ".orig" )
    except:
        print "backuped original matrix source file does not exist, opening original! "
        try:
            f = open( matrix_src_file_path )
            do_backup = True
        except:
            print "ERROR:",matrix_src_file_path," <== cannot open file!! "

    #
    # parse matrix file and prep for the swapping procedure
    #
    origlines = f.readlines()
    to_be_modded_hel_lines = []
    lines_without_hel_lines = []
    for line in origlines:
        if line.find( "DATA" ) != -1 and line.find( "(NHEL" ) != -1:
            helicities = line.strip().split("/")[1].strip().split(",")
            isHelicityGood = True
            for idx, p in enumerate( particles ):
                if pols[idx] == "T":
                    if int( helicities[p] ) not in [-1, 1]:
                        isHelicityGood = False
                if pols[idx] == "L":
                    if int( helicities[p] ) not in [0]:
                        isHelicityGood = False
                if pols[idx] == "r":
                    if int( helicities[p] ) not in [1]:
                        isHelicityGood = False
                if pols[idx] == "l":
                    if int( helicities[p] ) not in [-1]:
                        isHelicityGood = False
            if isHelicityGood:
                to_be_modded_hel_lines.append( line )
                lines_without_hel_lines.append( "HERE" )
        elif line.find( "PARAMETER" ) != -1 and line.find( "NCOMB" ) != -1 and line.find( "=" ) != -1 and line.find( "THEL" ) == -1:
                lines_without_hel_lines.append( "NEWNCOMB" )
        else:
            lines_without_hel_lines.append( line )

    #
    # count new number of combinations
    #
    ncomb = len( to_be_modded_hel_lines )

    index_new_hel_line = 0

    newlines = []

    for lines_without_hel_line in lines_without_hel_lines:
        if lines_without_hel_line.find( "HERE" ) != -1:
            modline = to_be_modded_hel_lines[index_new_hel_line].split(",")
            modline[1] = "%d)"%(index_new_hel_line+1) # fortran indexing starts with 1.
            index_new_hel_line += 1
            newlines.append( ",".join( modline ) )
        elif lines_without_hel_line.find( "NEWNCOMB" ) != -1:
            newlines.append(  "      PARAMETER ( NCOMB = %d)\n" % ncomb )
        else:
            newlines.append( lines_without_hel_line )

    # save the original file

    if do_backup:
        os.system( "cp %s %s" %( matrix_src_file_path, matrix_src_file_path + ".orig" ) )

    f = open( matrix_src_file_path, "w" )

    for line in newlines:
        f.write( line )

all_matrix_src_files = glob.glob( subprocess_path + "P0_*/matrix*.f" )
for srcfile in all_matrix_src_files:
    rewrite_matrix( srcfile, particles, pols )
