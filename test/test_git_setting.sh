#!/bin/zsh

readonly SCRIPT_NAME="$(basename "${BASH_SOURCE:-$0}")"

usage () {
    cat << EOS
Usage: $SCRIPT_NAME
       $SCRIPT_NAME help
Check whether git config --bloal (merge|pull).ff is false and true respectively.
Any arguments except "help" are ignored.
EOS
}

test () {
    if [[ $1 != $2 ]]; then
        echo "Test failed!" >&2
        echo "  Expected: $1" >&2
        echo "  Got:      $2" >&2
        exit 1
    fi
}

if [[ $1 == "help" ]]; then
    usage
    exit
fi

test $(git config --global merge.ff) "false"
test $(git config --global pull.ff) "true"

echo "$SCRIPT_NAME succeeded!"
