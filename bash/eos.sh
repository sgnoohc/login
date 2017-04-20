#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

# === eos === #

#--- mounts eos to home area
function _eos() {
	mkdir -p $HOME/eos
	eosumount $HOME/eos
	eosmount $HOME/eos
}

#--- list my eos area
function _showeos() {
	EOSCOMMAND="/afs/cern.ch/project/eos/installation/0.2.31/bin/eos.select"
	INITIAL=$(echo $USER | cut -c1)
	RES=`${EOSCOMMAND} ls root://eosatlas//eos/atlas/user/$INITIAL/$USER/$*`
	if [ -z "${RES}" ]; then
	  ${EOSCOMMAND} ls root://eosatlas//eos/atlas/user/$INITIAL/$USER/$*/
	else
	  ${EOSCOMMAND} ls root://eosatlas//eos/atlas/user/$INITIAL/$USER/$*
	fi
}



#eof
