#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

function key() {
   kinit phchang@CERN.CH
}
function lep() {
  ssh lep
}
function lepplus() {
  ssh lepplus
}
function lxp() {
  export CURLXP=$(scp lxpnew:~/login/.hostname /dev/stdout | tail -n 1)
  echo $CURLXP
  ssh $CURLXP
}
function lxpnew() {
  ssh lxplus.cern.ch
}
function lx5p() {
  ssh -t lx5p 'screen -x'
}
function lx5() {
  ssh -t lx5 'screen -x'
}
function lx5s() {
  ssh -t lx5s 'screen -x'
}
function lx5m() {
  ssh -t lx5m 'screen -x'
}
function lx5l() {
  ssh -t lx5l 'screen -x'
}
function vm() {
  ssh -t vm 'screen -x'
}
function mike() {
  ssh -t mike 'screen -x'
}
function ssb() {
  ssh -t ssb 'screen -x'
}

function sshweb() {
  ssh -A -t uaf-7 ssh -A -t ucsdweb
}

#eof
