#!/bin/bash

SCRIPT_NAME="$(basename "${BASH_SOURCE:-$0}")"

usage () {
    cat << EOS
Usage: $SCRIPT_NAME <command>
Check whether all files in the list exist or not.

You have to specify a command:
    all     Check all files listed in all files in link_list dir.
    basic   Check all files listed in basic_list.txt.
    help    Show this help message.
EOS
}

if [[ $# -lt 1 ]]; then
    usage >&2
    exit 1
fi

if [[ $1  == help ]]; then
    usage
    exit
fi

LINK_LIST_DIR="$(cd ../link_list; pwd)"
LINK_FILES="$LINK_LIST_DIR/basic_list.txt"
if [[ $1 == all ]]; then
    LINK_FILES+=" $LINK_LIST_DIR/x_list.txt"
fi

DOTFILES_DIR="$(pwd|sed -r 's/(.*dotfiles)\/.*/\1/g')"

cat $LINK_FILES|while read line
do
    symlink=$(eval echo $(echo $line|awk '{print $2}'))
    origin="$DOTFILES_DIR/$(eval echo $(echo $line|awk '{print $1}'))"

    echo -n "Checking $symlink -> $origin..."
    if [[ $(readlink $symlink) != "$origin" ]]; then
        echo
        echo "Test failed!" >&2
        echo "readlink $symlink" >&2
        echo "  expected $origin" >&2
        echo "  got $(readlink $symlink)" >&2
        exit 1
    fi
    echo " OK."
done

echo "$SCRIPT_NAME succeeded!"
