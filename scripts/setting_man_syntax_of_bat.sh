#!/bin/zsh

mkdir -p $HOME/.config/bat/syntaxes
ln -s $HOME/dotfiles/scripts/Man.sublime-syntax $HOME/.config/bat/syntaxes/Man.sublime-syntax

bat cache --build
