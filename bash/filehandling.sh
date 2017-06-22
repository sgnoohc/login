#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

#--- echoes full path
function _fullpath(){
	echo $('cd' $(dirname $1); pwd)/$(basename $1)
}

#--- swap two files
function _swapfile() {
	mv $1 $1_swapfile_specific
	mv $2 $1
	mv $1_swapfile_specific $2
}

function _pushtolocal() {
	if [ -z $1 ]; then echo "Must provide filename!"; return; fi
	scp -P2222 $1 127.0.0.1:~/dump
}


#eof
