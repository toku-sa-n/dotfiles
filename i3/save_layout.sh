#!/bin/bash

for i in $(seq 1 10)
do
    i3-save-tree --workspace $i|sed '1d'|sed -r '/^ *\/\// {/"class"/!d}'|sed 's/\/\///g'|sed '/"class"/ s/,$//g' > ~/.config/i3/workspace_$i.json
done
