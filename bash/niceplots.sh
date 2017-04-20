#!/bin/bash

if [ $# -lt 1 ]; then
    echo "usage: $(basename $BASH_SOURCE) <folder name>"
    return 1
fi

dir=$1
outdir=$1

if [ $# -gt 1 ]; then
    echo "Will put the stuff in $outdir instead"
    outdir=$2;
fi

ls -1 ${dir}/*.pdf | xargs -I%  -n 1 -P 10 sh -c "pdftopng % 100;"
#ls -1 ${dir}/*/*.pdf | xargs -I%  -n 1 -P 10 sh -c "pdftopng % 100;"

# for i in $(ls -1 $dir/*.pdf); do
#     pdftopng $i &
#     sleep 0.2
# done
# wait

index=$HOME/syncfiles/miscfiles/index.php

ln -sf $index $dir/index.php



# wait
chmod -R a+r $dir
rm -rf ~/public_html/dump/$outdir/
mkdir -p ~/public_html/dump/$outdir/
if [[ $(hostname) == *uaf-* ]]; then
    cp -rp $dir/* ~/public_html/dump/$outdir/
    chmod -R 755 ~/public_html/dump/$outdir/
#else
#    ssh $USER@uaf-6.t2.ucsd.edu "mkdir -p ~/public_html/dump/$outdir; rm ~/public_html/dump/$outdir/*.png"
#    scp -rp $dir/* $USER@uaf-6.t2.ucsd.edu:~/public_html/dump/$outdir/
fi
echo "uaf-10.t2.ucsd.edu/~$USER/dump/$outdir/"
