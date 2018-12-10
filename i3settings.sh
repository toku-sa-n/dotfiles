#!/bin/bash

#Autosettings for i3 and i3blocks

I3_DIR=$HOME/.config/i3
BLOCKS_DIR=$HOME/.config/i3blocks

I3_CONFIG=$I3_DIR/config
BLOCKS_CONFIG=$BLOCKS_DIR/config

DOTFILES=$HOME/dotfiles

if [ ! -d $I3_DIR ]; then
    mkdir $I3_DIR
elif [ -f $I3_CONFIG ] && [ ! -L $I3_CONFIG ]; then
    mv $I3_CONFIG $I3_DIR/config.old
fi

if [ ! -d $BLOCKS_DIR ]; then
    mkdir $BLOCKS_DIR
elif [ -f $BLOCKS_CONFIG ] && [ ! -L $BLOCKS_CONFIG ]; then
    mv $BLOCKS_CONFIG $BLOCKS_DIR/config.old
fi

if [ ! -L $I3_CONFIG ]; then
    ln -sF $DOTFILES/.i3config $I3_CONFIG
fi
if [ ! -L $BLOCKS_CONFIG ]; then
    ln -sF $DOTFILES/.i3blocks_config $BLOCKS_CONFIG
fi

PACLIST=$(pacman -Ql|awk -F " " '{print $1}'|uniq)

INST_PAC=""

if ! echo "$PACLIST" | grep -q "awesome-terminal-fonts"; then
    INST_PAC="awesome-terminal-fonts"
fi

if ! echo "$PACLIST" | grep -q "ttf-font-awesome" ; then
    INST_PAC="$INST_PAC ttf-font-awesome"
fi

if ! echo "$PACLIST" | grep -q "upower" ; then
    INST_PAC="$INST_PAC upower"
fi

if [[ -n "$INST_PAC" ]]; then
    sudo pacman -S $INST_PAC
fi

echo "Restart i3."
