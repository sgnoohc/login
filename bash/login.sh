#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

#--- updates login package
function _mupdate() {
	pushd ~/login
	svn up
	. ~/.bashrc
	popd
  jarvis
}

#--- svn ci login pacakge
function _mci() {
	pushd ~/login
	svn ci -m "update"
	. ~/.bashrc
	popd
  jarvis
}


#eof
