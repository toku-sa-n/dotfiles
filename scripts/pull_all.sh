#!/bin/bash
# Don't change from bash to zsh! This script won't work!

for path in $(git config --global remind.paths|tr ',' ' ')
do
    (cd $path && git pull)
done
