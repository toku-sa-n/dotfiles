#!/bin/bash

# The root dir of all src paths in link_list is dotfiles, not root (/).
# However, dst is root (/).

ARGV=("$@")

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

# TODO make a directory when needed. ex. i3 files.

SCRIPT_DIR=$(cd $(dirname $0); pwd)
LINK_DIR="$SCRIPT_DIR/link_list/"
DOTFILES_DIR=$(echo $SCRIPT_DIR|sed -r 's/(.*dotfiles)\/.*/\1/g')

while read line
do
    src=$(eval echo $(echo $line|awk '{print $1}'))
    dst=$(eval echo $(echo $line|awk '{print $2}'))
    # TODO: Delete unnecessary ""
    # TODO: Delete -F option
    ln -sF "$DOTFILES_DIR/$src" "$dst"
done <"${LINK_DIR}${LINK_FILE}"
