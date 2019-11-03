#!/bin/bash

for path in $(git config --global remind.paths|sed 's/,/ /g')
do
    (cd $path && git pull)
done
