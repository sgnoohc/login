#!/bin/env python

import os
import sys
from array import array
from ROOT import *
import copy

# deprecated. Will retire in the future
def readMetaDataFile(file):
    return readMetaDataFromFile(file)

###################################################
# readMetaDataFile will read table file into a list
# of dicts
#
#  # item0  item1  item2
#  #===============================
#  val0 val1 val2
#  val0 val1 val2
#  ...
#  val0 val1 val2
#
# metadata = [
#    { 'item0': val0, 'item1': val1, 'item2': val2}
#    { 'item0': val0, 'item1': val1, 'item2': val2}
#    ...
#    { 'item0': val0, 'item1': val1, 'item2': val2}
# ]
###################################################
def readMetaDataFromFile(file):

    # read file
    lines = open(file).readlines()

    # will contain objects
    metadata = list()

    # parse categories
    isnextline = False
    nheaderlines = 1
    for line in lines:
        if isnextline:
            categoryline = line.replace('#','').strip()
            break
        if line.find("Format") != -1:
            isnextline = True
        nheaderlines += 1
    if not isnextline:
        print 'ERROR - no header has been found til the end of the file', file
        sys.exit(-1)
    rawcategories = categoryline.split(":")
    categories = []
    for category in rawcategories:
        categories.append(category.strip())

    # parse items
    for index, line in enumerate(lines):
        if index < nheaderlines:
            continue

        # skip commented lines
        if line.find('#') != -1:
            continue

        # skip empty lines
        if len(line.strip()) == 0:
            continue

        # split items
        vals = line.split()

        if len(vals) < len(categories):
            print 'WARNING - Wrong number of items and categories. Padding blank items at the end of the list! Please check if this is okay!'
            print '   val:'
            print '      ','  '.join(vals)
            print '   categories:'
            print '      ','  '.join(categories)
            difference = len(categories) - len(vals)
            for i in xrange(difference):
                vals.append('')
        elif len(vals) != len(categories):
            print 'ERROR - Wrong number of items and categories'
            print len(vals), len(categories)
            print line
            return None

        # create dict
        item = {}
        for index, category in enumerate(categories):
            item[category] = vals[index]

        # add the item
        metadata.append(item)

    return metadata

###################################################
# Write metadata read
###################################################
def writeMetaDataToFile(metadata, output, headerformat="", contentformat=""):

    # open output file
    outputfile = open(output, "w")

    outputfile.write("#" * 180 + "\n")
    outputfile.write("Format\n")

    # empty headerformat / container format
    if not headerformat:
        longest = 0
        for key in metadata[0]:
            if len(key) > longest:
                longest = len(key)
        items = []
        for key in metadata[0]:
            items.append("%-"+str(longest)+"s")
        headerformat = ' : '.join(items)

    # empty headerformat / container format
    if not contentformat:
        longest = 0
        lengths = []
        for key in metadata[0]:
            longest = 0
            for metadatum in metadata:
                if len(metadatum[key]) > longest:
                    longest = len(metadatum[key])
            lengths.append(longest)
        items = []
        for length in lengths:
            items.append("%-"+str(length)+"s")
        contentformat = ' '.join(items)

    print headerformat, contentformat

    # write categories at the top
    toprocesscategories = metadata[0]
    categories = []
    for cateogry in toprocesscategories:
        categories.append(cateogry.strip())
    if headerformat:
        if headerformat.find(":") == -1:
            print "ERROR - provided heaer format does not have the proper delimiter included! The delimiter ':' must be included in the format" 
            print "        you provided ",headerformat
        outputfile.write( (headerformat + "\n") % tuple(categories) )
    else:
        outputfile.write("%s\n"%(":".join(categories)))

    outputfile.write("#" * 180 + "\n")

    # write contents
    for metadatum in metadata:
        contents = []
        for cateogry in metadatum:
            if contentformat:
                contents.append(metadatum[cateogry])
            else:
                outputfile.write(metadatum[cateogry] + " ")
        if contentformat:
            outputfile.write( (contentformat + "\n") % tuple(contents) )
        else:
            outputfile.write("\n")

###################################################
# print object as "print" is special in python
###################################################
def findMetaData(key, val, metadata):
    for metadatum in metadata:
        if metadatum[key] == val:
            return metadatum
    return None

###################################################
# print object as "print" is special in python
###################################################
def printObj(obj, arg = None):
    if arg:
        getattr(obj, 'print')(arg)
    else:
        getattr(obj, 'print')()

###################################################
# save commands to /path/to/.script.py.history
###################################################
def saveCommand():
    scriptfileloc = os.path.dirname(sys.argv[0])
    scriptname = os.path.basename(sys.argv[0])
    historyfilename = '.' + scriptname + '.history'
    historyfilefullpath = os.path.join(scriptfileloc, historyfilename)
    historyfile = open(historyfilefullpath, 'a')
    historyfileforcheck = open(historyfilefullpath, 'r')
    thiscommand = ' '.join(sys.argv)
    try:
        if historyfileforcheck.readlines()[-1].find(thiscommand) == -1:
            historyfile.write(' '.join(sys.argv) + '\n')
    except:
        historyfile.write(' '.join(sys.argv) + '\n')

###################################################
# set palette color
# http://ultrahigh.org/2007/08/making-pretty-root-color-palettes/
###################################################
def set_palette(name='palette', ncontours=999):
    '''Set a color palette from a given RGB list
    stops, red, green and blue should all be lists of the same length
    see set_decent_colors for an example'''

    if name == 'gray' or name == 'grayscale':
        stops = [0.00, 0.34, 0.61, 0.84, 1.00]
        red   = [1.00, 0.84, 0.61, 0.34, 0.00]
        green = [1.00, 0.84, 0.61, 0.34, 0.00]
        blue  = [1.00, 0.84, 0.61, 0.34, 0.00]
    # elif name == 'whatever':
        # (define more palettes)
    else:
        # default palette, looks cool
        stops = [0.00, 0.34, 0.61, 0.84, 1.00]
        red   = [0.00, 0.00, 0.87, 1.00, 0.51]
        green = [0.00, 0.81, 1.00, 0.20, 0.00]
        blue  = [0.51, 1.00, 0.12, 0.00, 0.00]

    s = array('d', stops)
    r = array('d', red)
    g = array('d', green)
    b = array('d', blue)

    npoints = len(s)
    TColor.CreateGradientColorTable(npoints, s, r, g, b, ncontours)
    gStyle.SetNumberContours(ncontours)

###################################################
# process minimal path even when [,] is used
###################################################
def get_example_path(path):
    if path.find('[') != -1:
        items = path.replace('[',';').replace(']',';').split(';')
        newitems = []
        for item in items:
            if item.find('+') != -1:
                newitems.append(item.split('+')[0])
            else:
                newitems.append(item)
        return ''.join(newitems)
    else:
        return path

###################################################
# get folder with name by recursive search
###################################################
def get_folder_with_name(samplefolder, name):
    print samplefolder.GetName()
    if samplefolder.GetName() == name:
        return samplefolder
    else:
        if samplefolder.getListOfFolders("?"):
            for subfolder in samplefolder.getListOfFolders("?"):
                sample = get_folder_with_name(subfolder, name)
                if sample:
                    return sample
    return None

###################################################
# get folder with name by recursive search
###################################################
def clear_all_jobs(cuts):
    for cut in cuts.getListOfCuts():
        cut.clearAnalysisJobs()

###################################################
# compare metadata
###################################################
def compare(metadata1, metadata2):
    #print metadata1
    #print metadata2

    matches = []
    metadata1_indexed = {}

    for item in metadata1:
        tuplekey = ()
        for key in item:
            tuplekey += tuplekey + (item[key],)
        metadata1_indexed[tuplekey] = item

    for item in metadata2:
        tuplekey = ()
        for key in item:
            tuplekey += tuplekey + (item[key],)
        if tuplekey in metadata1_indexed:
            matches.append(item)

    metadata1copy = copy.deepcopy(metadata1)
    metadata2copy = copy.deepcopy(metadata2)
    for item in matches:
        metadata1copy.remove(item)
        metadata2copy.remove(item)

    print 'metadata1'
    for item in metadata1copy:
        print item

    print 'metadata2'
    for item in metadata2copy:
        print item

#eof
