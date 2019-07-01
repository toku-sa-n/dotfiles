#!/bin/zsh

mkdir -p $HOME/.config/bat/syntaxes
ln -s $HOME/dotfiles/Man.sublime-syntax $HOME/.config/bat/syntaxes/Man.sublime-syntax

bat cache --build
