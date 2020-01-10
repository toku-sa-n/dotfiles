#!/bin/zsh

for path in $(git config --global remind.paths|tr ',' ' ')
do
    (cd $path && git pull)
done
