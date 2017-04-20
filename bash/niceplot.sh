#!/bin/bash

function niceplots {
source ~/login/bash/niceplots.sh $@
}
export -f niceplots

function pdftopng {
#sharpen not really necessary
#convert -density 250 -trim $1 -quality 100 -sharpen 0x1.0 ${1%%.pdf}.png
if [ $# -gt 0 ]; then
    echo "$1 ==> ${1%%.pdf}.png"
    # if [[ $HOST == *uaf-* ]]; then
    #     gs -q -sDEVICE=pngalpha -o ${1%%.pdf}.png -sDEVICE=pngalpha -r144 $1
    # else

    density=150
    if [ $# -gt 1 ]; then
        density=$2
    fi
    convert -density ${density} -trim $1 -fuzz 1% ${1%%.pdf}.png

    # fi
else
    echo "Usage: pdftopng <pdf name> [optional density]"
fi
}
export -f pdftopng
