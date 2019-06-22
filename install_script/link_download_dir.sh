#!/bin/bash

set -e

cp "$HOME/ダウンロード/"* $HOME/Downloads
rm -rf $HOME/ダウンロード
ln -s $HOME/Downloads $HOME/ダウンロード
