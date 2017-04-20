if [ "$#" -lt 5 ]; then
  echo "--------------Quick Draw Histogram of a variable--------------------"
  echo "  useage: drawHist.sh [filename] [treename] [varname] [weight] [cut]"
  echo "--------------------------------------------------------------------"
  exit
fi

root -l -b -q DrawHist.C\(\"$1\",\"$2\",\"$3\",\"$4\",\"$5\"\)
