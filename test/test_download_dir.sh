#!/bin/zsh

set -e

readonly SCRIPT_NAME="$(basename "${BASH_SOURCE:-$0}")"

usage () {
    cat << EOS
Usage: $SCRIPT_NAME
Check whether "ダウンロード" directory is the symlink to "Downloads" directory.
Any arguments except "help" are ignored.
EOS
}

if [[ $1 == help ]]; then
    usage
    exit
fi

if [[ $(readlink $HOME/ダウンロード) != "$HOME/Downloads" ]]; then
    echo "Test failed!" >&2
    echo "Directory \"ダウンロード\" is not the symlink to \"Downloads\" directory!" >&2
    exit 1
fi

echo "$SCRIPT_NAME succeded!"
