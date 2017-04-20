#void AddBranch( const char* filename,             //1
#                const char* treename,             //2
#                const char* outputname,           //3
#                const char* outputtreename,       //4
#                const char* expression,           //5
#                const char* exprname,             //6
#                const char* type,                 //7
#                const char* option = "RECREATE"   //8
#              )
if [ "$#" -lt 7 ]; then                                                                                                                                                                                                  
  echo "--------------Process TTree and Add Branch------------------"
  echo "  useage: addBranch.sh [filename] [treename] [outputname] [outputtreename] [expression] [exprname] [type] [newfileopenoption]"
  echo " comment: Be careful of the newfileopenoption setting as "
  echo "          depending on what you want to do differen option should be used"
  echo "------------------------------------------------------"
  exit
fi
root -l -b -q AddBranch.C\(\"$1\",\"$2\",\"$3\",\"$4\",\"$5\",\"$6\",\"$7\",\"$8\"\)
