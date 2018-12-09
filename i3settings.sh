#!/bin/bash

#Autosettings for i3 and i3blocks

if [ ! -d $HOME/.config/i3 ]; then
    mkdir $HOME/.config/i3
elif [ -f $HOME/.config/i3/config ]; then
    mv $HOME/.config/i3/config $HOME/.config/i3/config.old
fi

if [ ! -d $HOME/.config/i3blocks ]; then
    mkdir $HOME/.config/i3blocks
elif [ -f $HOME/.config/i3blocks/config ]; then
    mv $HOME/.config/i3blocks/config $HOME/.config/i3blocks/config.old
fi

if [ ! -L $HOME/.config/i3/config ]; then
    ln -sF $HOME/dotfiles/.i3config $HOME/.config/i3/config
fi
if [ ! -L $HOME/.config/i3/config ]; then
    ln -sF $HOME/dotfiles/.i3blocks_config $HOME/.config/i3blocks/config
fi
echo "Restart i3."
