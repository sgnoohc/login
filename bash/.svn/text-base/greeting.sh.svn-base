#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

function add_common_msg() {
  add_msg "$1" ~/login/bashfunctions/commonmsg.txt
}

function add_work_msg() {
  add_msg "$1" ~/login/bashfunctions/workmsg.txt
}

function add_home_msg() {
  add_msg "$1" ~/login/bashfunctions/homemsg.txt
}

function add_msg() {
  MSG="$1"
  INFILE="$2"
  echo "${MSG}" >> $2
}

function get_work_msg() {
  get_msg $1 ~/login/bashfunctions/workmsg.txt
}

function get_home_msg() {
  get_msg $1 ~/login/bashfunctions/homemsg.txt
}

function get_msg() {
  MSGINDEX=$1
  INFILE=$2
  INDEX=$(loop_index $MSGINDEX $INFILE)
  echo $(head -n$((INDEX+1)) ${INFILE} | tail -n1)
}

function random_work_msg() {
  INDEX=$(date +%s)
  get_work_msg $INDEX
}

function random_home_msg() {
  INDEX=$(date +%s)
  get_home_msg $INDEX
}

function loop_index() {
  INDEX=$1
  INFILE=$2
  NTOTAL=$(cat ${INFILE} | wc -l)
  LOOPINDEX=$((INDEX%NTOTAL))
  echo $LOOPINDEX
}

#--- greeting information
function greeting() {
  if [ "${THISOS}" == "Mac" ]; then
    jarvisinfo "$(random_home_msg)"
  else
    jarvisinfo "$(random_work_msg)"
  fi
}


