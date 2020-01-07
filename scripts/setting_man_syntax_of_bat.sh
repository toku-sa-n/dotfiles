#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

mkdir -p $HOME/.config/bat/syntaxes
ln -s {$SCRIPT_DIR,$HOME/.config/bat/syntaxes}/Man.sublime-syntax

bat cache --build
