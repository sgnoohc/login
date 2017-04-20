#  .  may 21, 2013
# ..: philip.chang, university of illinois at urbana-champaign, physics dept.

if [ "$#" -lt 3 ]; then
  echo "--------------Copy root file with cut word---------------"
  echo "  useage: cutTree.sh [filename] [cutword] [outputname]"
  echo "---------------------------------------------------------"
  exit
fi

root -l -b -q ~/login/mymacros/CopyFile.C\(\"$1\",\"$2\",\"$3\"\)

#eof
