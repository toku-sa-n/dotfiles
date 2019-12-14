#!/bin/bash

set -e

# For the information of wildcard, see the url below.
# https://stackoverflow.com/questions/21924351/copying-files-with-wildcard-to-a-folder-in-a-bash-script-why-isnt-it-work
cp "$HOME/ダウンロード/"* $HOME/Downloads
rm -rf $HOME/ダウンロード
ln -s $HOME/Downloads $HOME/ダウンロード
