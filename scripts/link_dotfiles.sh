#!/bin/zsh

set -e

# The root dir of all src paths in link_list is dotfiles, not root (/).
# However for dst, root is root (/).

readonly SCRIPT_NAME="$(basename "${BASH_SOURCE:-$0}")"

usage () {
    cat << EOS
Usage: $SCRIPT_NAME
       $SCRIPT_NAME <command>
Make symlinks to dotfiles (.vimrc, .zshrc, etc.) and config files (~/.config/i3/config, etc.) .
If no command is specified, then dotfiles and config files which are not related to Xwindows (except .Xresources because this file is also used by rxvt-unicode) .

Available commands:
    all     Make symlinks to dotfiles and config files of Xwindows-related applications also.
    help    Show this help.
EOS
}

ARGV=("$@")

readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)
readonly DOTFILES_DIR=$(echo $SCRIPT_DIR|sed -r 's/(.*dotfiles)\/.*/\1/g')
readonly LINK_DIR="$DOTFILES_DIR/link_list/"
case "${ARGV[0]}" in
    "" )
        link_file="${LINK_DIR}basic_list.txt"
        ;;
    "all" )
        link_file="${LINK_DIR}basic_list.txt ${LINK_DIR}x_list.txt"
        ;;
    "help" )
        usage
        exit
        ;;
    * )
        usage >&2
        exit 1
        ;;
esac

cat ${link_file}|while read line
do
    src=$(eval echo $(echo $line|awk '{print $1}'))
    dst=$(eval echo $(echo $line|awk '{print $2}'))
    mkdir -p $(dirname $dst)
    ln -sf "$DOTFILES_DIR/$src" "$dst"
done
