#!/bin/bash

set -e

readonly SCRIPT_NAME="$(basename "${BASH_SOURCE:-$0}")"

usage () {
    cat << EOS
Usage: $SCRIPT_NAME
       $SCRIPT_NAME <command>
Update portage, kernel, and non-systemwide packages (pip, zplug, gem etc.) . If no command is specified, then these all will be updated.
Run this script as NON-ROOT. Root user cannot update non-systemwide packages (pip, zplug, gem etc.) .

Available commands:
    non_systemwide  Update non-systemwide packages (pip, zplug, gem etc.) only.
    help            Show this help.
EOS
}

non_systemwide () {
    command_exists () {
        command -v $1 > /dev/null
    }

    # TODO: Prevent pip from exiting with return code non-zero when there is no package to update.
    command_exists pip && pip list --outdated --format=freeze | awk -F '=' '{print $1}'| xargs pip install --upgrade --user
    command_exists zplug && zplug update
    command_exists gem && gem update

    # Vim will exit with exit status 0 even vim-plug is not installed.
    # Therefore it is not needed to delete `set -e`.
    vim +PlugUpdate +q +q
}


if [[ $(whoami) = "root" ]]; then
    echo "Run as non-root. Root user can't update non-systemwide packages such as pip, zplug, gem, etc." >&2
    exit 1
fi

if [[ $# -gt 1 ]]; then
    usage >&2
    exit 1
fi

case "$1" in
    "" ) sudo ./update_gentoo.sh && non_systemwide ;;
    "non_systemwide") non_systemwide ;;
    "help") usage ;;
    * ) usage >&2 && exit 1 ;;
esac
