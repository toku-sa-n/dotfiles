#!/bin/zsh

IMG_DIR="$HOME/background_images"

if [ ! -d $IMG_DIR ]; then
    echo Make background_images directory(Y/N)?
    read YN
    if [ $YN -eq "Y" ]; then
        mkdir "$IMG_DIR"
    fi
else
    if [ "$(ls -A $IMG_DIR)" ]; then
        ls $IMG_DIR|sort -R|tail -1|while read IMGFILE; do
            feh --bg-scale "$IMG_DIR/$IMGFILE";
        done
    fi
fi
