#!/bin/env python

############################################################################
#
#
# Histogram maker
#
#
############################################################################

import ROOT
import os

ROOT.gROOT.SetBatch( True )
ROOT.gStyle.SetPaintTextFormat(".2f")

def get_histname_1d( samplelabel, xvarname, label ):
    return "h__%s__%s__%s" % ( xvarname, samplelabel, label )
def get_histname_2d( samplelabel, xvarname, yvarname, label ):
    return "h__%s___%s__%s__%s" % ( xvarname, yvarname, samplelabel, label )
#
# Make hist class
#
class HistFactory:

    # constructor
    def __init__( self, samplelabel, tfilename, ttreename, ofilename, producepdf=False ):
        self.samplelabel = samplelabel
        self.tfilename = tfilename
        self.ttreename = ttreename
        self.ofilename = ofilename
        self.producepdf = producepdf
        self.tfile = 0
        self.ttree = 0
        self.ofile = 0
        self.is_input_open_val = False
        self.is_output_open_val = False

    # open the input file and ttree that will be for plotting
    def open_input( self ):
        self.tfile = ROOT.TFile( self.tfilename )
        self.ttree = self.tfile.Get( self.ttreename )
        self.is_input_open_val = True

    # function returning whether the input file is open or not
    # will be used to open the input file if not opened
    def is_input_open( self ):
        return self.is_input_open_val

    # open the output file that will save all the histograms
    def open_output( self ):
        self.ofile = ROOT.TFile( self.ofilename, "UPDATE" )
        self.is_output_open_val = True

    # function returning whether the output file is open or not
    # will be used to open the output file if not opened
    def is_output_open( self ):
        return self.is_output_open_val

    # main draw function. crates a histogram based on the draw string and saves it.
    # will be used to open the output file if not opened
    def draw( self, varx, exprx, nbinx, xmin, xmax, cuts = "", label = "", vary = "NOYVAR", expry = "", nbiny = 0, ymin = 0, ymax = 0 ):
        if not self.is_input_open():
            self.open_input()
        is2d = False
        if vary != "NOYVAR":
            is2d = True
        histname = ""
        if is2d:
            histname = get_histname_2d( self.samplelabel, varx, vary, label )
        else:
            histname = get_histname_1d( self.samplelabel, varx, label )
        drawstr = ""
        if is2d:
            drawstr = "%s:%s>>%s( %d, %f, %f, %d, %f, %f )" % ( expry, exprx, histname, nbinx, xmin, xmax, nbiny, ymin, ymax )
        else:
            drawstr = "%s>>%s( %d, %f, %f )" % ( exprx, histname, nbinx, xmin, xmax )
        print drawstr
        cutstr = cuts # TODO
        print cutstr
        self.ttree.Draw( drawstr, cutstr, "e" )
        hist = ROOT.gDirectory.Get( histname )
        if is2d:
            hist.SetTitle( expry + "__" + exprx + "__" + "%d_%f_%f__%d_%f_%f" % (nbinx, xmin, xmax, nbiny, ymin, ymax) )
        else:
            hist.SetTitle( exprx + "__" + "%d_%f_%f" % (nbinx, xmin, xmax) )
        if not self.is_output_open():
            self.open_output()
        self.ofile.cd()
        hist.Write( hist.GetName(), ROOT.TObject.kOverwrite )
        if self.producepdf:
            c1 = ROOT.TCanvas( hist.GetName() + "_canvas", "", 0, 0, 800, 800 )
            hist.SetTitle("")
            hist.SetLineWidth(2)
            hist.SetLineColor(1)
            hist.SetMarkerSize(2)
            hist.SetFillColor(ROOT.kYellow)
            hist.SetBinContent( hist.GetNbinsX(), hist.GetBinContent( hist.GetNbinsX() ) + hist.GetBinContent( hist.GetNbinsX() + 1 ) )
            ROOT.gStyle.SetOptStat( 0 )
            #c1.SetLogy()
            if is2d:
                hist.Draw( "colz" )
            else:
                #hist.Draw( "histtext00" )
                hist.Draw( "hist" )
            c1.SaveAs( "plots/" + hist.GetName() + ".pdf" )
