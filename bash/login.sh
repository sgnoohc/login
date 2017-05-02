#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

#--- updates login package
function _mupdate() {
  pushd ~/login
  git pull
  . ~/.bashrc
  popd
  jarvis
}

#--- svn ci login pacakge
function _mci() {
  pushd ~/login
  git commit -a -m msg
  git push
  . ~/.bashrc
  popd
  jarvis
}


#eof
