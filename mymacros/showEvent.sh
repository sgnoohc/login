if [ "$#" -lt 3 ]; then
  echo "--------------ShowEvent in TTree------------------"
  echo "  useage: showEvent.sh [filename] [treename] [eventnumber] "
  echo "------------------------------------------------------"
  exit
fi

root -l -b -q ~/login/mymacros/ShowEvent.C\(\"$1\",\"$2\",$3\)
