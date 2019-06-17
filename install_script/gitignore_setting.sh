#!/bin/bash

ln -sF $HOME/dotfiles/.gitignore_global $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore
