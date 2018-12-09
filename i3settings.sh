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

FONTLIST=$(pacman -Ql|awk -F " " '{print $1}'|uniq)

INST_FONT=""

if ! echo "$FONTLIST" | grep -q "awesome-terminal-fonts"; then
    INST_FONT="awesome-terminal-fonts"
fi

if ! echo "$FONTLIST" | grep -q "ttf-font-awesome" ; then
    INST_FONT="$INST_FONT ttf-font-awesome"
fi

if [[ -n "$INST_FONT" ]]; then
    sudo pacman -S $INST_FONT
fi

echo "Restart i3."
