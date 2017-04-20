#!/bin/bash

##############################################################################
#
#
# TODO TODO TODO TODO TODO TODO
#
#
##############################################################################

EOSCOMMAND="/afs/cern.ch/project/eos/installation/0.2.31/bin/eos.select"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Help
usage()
{
  echo "ERROR - Usage:"
  echo
  echo "      sh $(basename $0) OPTIONSTRINGS ..."
  echo
  # TODO
  echo "Options with arguments:"
  echo "  -h    Help                   (Display this message)"
  echo "  -d    Directory              (e.g. -d mc02_24/Nominal)"
  echo "  -x    Xsection file          (e.g. -x Xsection8TeV_bkg_v10_VBFsummary.txt)"
  echo
  exit
}

# Command-line opts
# TODO
while getopts ":d:x:h" OPTION; do
  case $OPTION in
    d) MCDIR=${OPTARG};;
    x) XSEC=${OPTARG};;
    h) usage;;
    :) usage;;
  esac
done

# TODO
if [ -z ${MCDIR} ]; then usage; fi
if [ -z ${XSEC}  ]; then usage; fi

# Verbose
date
echo "================================================"
echo "$(basename $0) $*"
echo "$(basename $0) $*" >> $DIR/.$(basename $0).history
echo "------------------------------------------------"
# TODO
echo "MCDIR          : ${MCDIR}"
echo "XSEC           : ${XSEC}"
echo "================================================"

#
#
# function
#
#

# check if it's a number
function is_number() {
  re='^[0-9]+$'
  if [[ $1 =~ $re ]]; then echo 1; else echo 0; fi
}

# extract a string
# grep -Po '13TeV.\K[^.]+' <<<'....string...'
#           ^^^^^^    ^
#           keyword   to next .
# http://askubuntu.com/questions/697120/extract-word-from-string-using-grep-sed-awk

# $ echo "a b c d e" | tr ' ' '\n' | tail -1
# e


#eof
