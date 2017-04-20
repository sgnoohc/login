if [ "$#" -lt 4 ]; then
  echo "--------------Scan Tree with given expression------------------"
  echo "  useage: scanTree.sh [filename] [treename] [expression] [cut] [length]"
  echo "------------------------------------------------------"
  exit
fi


root -l -b -q ScanTree.C\(\"$1\",\"$2\",\"$3\",\"$4\",$5\)
