#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign


#--- sets up nice software manger for atlas
function _localsetup() {
	export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
	source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh # --quiet
}

#--- another independent asetup function
function _prepareAtlasSetup() {
	export AtlasSetup=/afs/cern.ch/atlas/software/dist/AtlasSetup
	alias asetup='source $AtlasSetup/scripts/asetup.sh'
}

#--- short cut for long voms command
function _gsetup() {
	voms-proxy-init -hours 168 -voms cms -rfc
}

#--- saves current node to the lxplus history
function _savehost() {
	echo "export NODE="$HOSTNAME >> .lxplus.history
}

#--- changes current directory to public recusviely
function _makepublic() {
	find . -type d -print -exec fs setacl {} system:anyuser rl \;
}

#--- changes current directory to public recusviely
function _linktowww() {
  if [[ -z $1 ]]; then
    echo "Error - usage:"
    echo ""
    echo "    _linktowww PATHTOFILE"
    echo ""
    echo ""
    return
  fi
	LINKPATH=$(_fullpath $1)
	cd ~/www
	ln -sf ${LINKPATH}
	echo "https://phchang.web.cern.ch/phchang/"$(basename ${LINKPATH})
	cd -
}


#eof
