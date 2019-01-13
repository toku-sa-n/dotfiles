#!/bin/zsh

IMG_DIR="$HOME/background_images"

if [ ! -d $IMG_DIR ]; then
    echo "Make background_images directory(Y/N)?"
    read YN
    if [ $YN = "Y" ]; then
        mkdir -v "$IMG_DIR"
    fi
else
    while true
    do
        if [ "$(ls -A $IMG_DIR)" ]; then
            ls $IMG_DIR|sort -R|tail -1|while read IMGFILE; do
                feh --bg-fill "$IMG_DIR/$IMGFILE";
            done
        fi
        sleep 5m
    done
fi
