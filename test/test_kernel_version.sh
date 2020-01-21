#!/bin/zsh

readonly SCRIPT_NAME="$(basename "${BASH_SOURCE:-$0}")"

usage () {
    cat << EOS
Usage: $SCRIPT_NAME
       $SCRIPT_NAME help
Check whether linux kernel of this computer is the latest one or not.
Any arguments except 'help' will be ignored.

Available command:
    help    Show this help.
EOS
}

if [[ "$1" == "help" ]]; then
    usage
    exit
fi

readonly ESELECT_INDEX=$(eselect kernel list|grep '*'|awk '{print $1}'|tr -d "[]")

if [[ $((ESELECT_INDEX+1)) -ne $(eselect kernel list|wc -l) ]]; then
    echo "Test failed!" >&2
    echo "eselect kernel is not set to the latest version!" >&2
    eselect kernel list
    exit 1
fi

readonly ESELECT_KERNEL_NAME=$(eselect kernel list|grep '*'|awk '{print $2}')

if [[ "$ESELECT_KERNEL_NAME" != $(readlink /usr/src/linux) ]]; then
    echo "Test failed!" >&2
    echo "/usr/src/linux is not a symlink to the latest kernel!" >&2
    echo "readlink /usr/src/linux: $(readlink /usr/src/linux)" >&2
    exit 1
fi

echo "$SCRIPT_NAME succeeded!"
