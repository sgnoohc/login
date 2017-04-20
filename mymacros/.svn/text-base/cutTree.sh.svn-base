#void CutTree( const char* filename,
#              const char* treename,
#              const char* cutword,
#              const char* outputfilename,
#              const char* outputtreename,
#              const char* option = "RECREATE" )
#{

if [ "$#" -lt 6 ]; then
  echo "--------------Cut Tree based on cutword------------------"
  echo "  useage: cutTree.sh [filename] [treename] [cutword] [outputfilename] [outputtreename] [openoption]"
  echo "------------------------------------------------------"
  exit
fi

echo "whatthe"
root -l -b -q ~/login/mymacros/CutTree.C\(\"$1\",\"$2\",\"$3\",\"$4\",\"$5\",\"$6\"\)
