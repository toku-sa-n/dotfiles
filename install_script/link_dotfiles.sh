#!/bin/bash

ARGV=("$@")

LINK_DIR="$HOME/dotfiles/link_list/"

case "${ARGV[0]}" in
    "basic" )
        LINK_FILE="basic_list.txt"
        ;;
    "X" )
        LINK_FILE="x_list.txt"
        ;;
    * )
        echo "Specify basic or X." >&2
        exit 1
        ;;
esac

#TODO make a directory when needed. ex. i3 files.

while read line
do
    src=$(eval echo $(echo $line|awk '{print $1}'))
    dst=$(eval echo $(echo $line|awk '{print $2}'))
    ln -sF "$src" "$dst"
done <"${LINK_DIR}${LINK_FILE}"
