#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

function _shareUsage() {
  echo "ERROR - Usage"
  echo ""
  echo "       _share OBJECT TARGETDIRPATH"
  echo ""
  echo "  TARGETDIRPATH can be one of the follwing:"
  echo "   e.g. bash configs lhes logs madgraph pdfs plots pythons results roots scripts tars txts md"
  echo ""
}

function _getshareUsage() {
  echo "ERROR - Usage"
  echo ""
  echo "       _getshare OBJECT TARGETDIRPATH"
  echo ""
  echo "  TARGETDIRPATH can be one of the follwing:"
  echo "   e.g. bash configs lhes logs madgraph pdfs plots pythons results roots scripts tars txts md"
  echo ""
}

function _publishUsage() {
  echo "ERROR - Usage"
  echo ""
  echo "       _publish TARGETDIRPATH"
  echo ""
  echo ""
}

#--- scp's the target to public area in lx2.physics.uiuc.edu
function _share() {
  if [ -z $1 ]; then _shareUsage; return; fi
  if [ -z $2 ]; then _shareUsage; return; fi
  echo scp -r $1 lxp:~/www/public/$2/
  scp -r $1 lxp:~/www/public/$2/
  echo $(basename $1)
  echo http://cern.ch/phchang/public/$2/$(basename $1)
}

#--- fetches the target from public area in lx2.physics.uiuc.edu
function _getshare() {
  if [ -z $1 ]; then _getshareUsage; return; fi
  if [ -z $2 ]; then _getshareUsage; return; fi
  if [ "${THISOS}" == "Mac" ]; then
    #curl -O http://webusers.physics.illinois.edu/~pcchang2/public/$2/$1
    scp -r pcchang2@lx2.physics.uiuc.edu:~/public_html/public/$2/$1 ./
  else
    #wget http://webusers.physics.illinois.edu/~pcchang2/public/$2/$1
    scp -r pcchang2@lx2.physics.uiuc.edu:~/public_html/public/$2/$1 ./
  fi
}

function _publish() {
  if [ -z $1 ]; then _publishUsage; return; fi
  chmod 755 -R $1
}


#eof
