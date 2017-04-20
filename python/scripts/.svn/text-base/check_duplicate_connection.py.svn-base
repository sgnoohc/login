#!/bin/bash

# check duplicate connections in the .conn files, if any
# for each line of the connection, check the moduleID being duplicated or not

import sys
import os
import glob

if len(sys.argv) != 2:
    print "Usage : %s DIR_PATH_THAT_HAS_CONN_FILES"
    sys.exit(-1)

baseconnfilepath = sys.argv[1]
connfilepaths = glob.glob(os.path.join(baseconnfilepath, "*conn"))
for connfilepath in connfilepaths:
    connfile = open(connfilepath,'r')
    lines = connfile.readlines()
    for line in lines:
        conns = line.split()[2:]
        nconn = len(conns)/6
        connset = set()
        for i in xrange(nconn):
            connset.add( conns[i*6+2] + conns[i*6+3] + conns[i*6+4] + conns[i*6+5] )
        if nconn != len(connset):
            print "infile=",connfilepath, "number of duplication=",nconn-len(connset), "problemline=",line.strip()
