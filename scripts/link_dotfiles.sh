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

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOTFILES_DIR=$(echo $SCRIPT_DIR|sed -r 's/(.*dotfiles)\/.*/\1/g')
LINK_DIR="$DOTFILES_DIR/link_list/"

while read line
do
    src=$(eval echo $(echo $line|awk '{print $1}'))
    dst=$(eval echo $(echo $line|awk '{print $2}'))
    mkdir -p $(dirname $dst)
    ln -s "$DOTFILES_DIR/$src" "$dst"
done <"${LINK_DIR}${LINK_FILE}"
