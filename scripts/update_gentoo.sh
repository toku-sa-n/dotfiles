#!/bin/zsh

if [[ $(whoami) != "root" ]]; then
    echo 'Run as root.' >&2
    exit 1
fi

emerge-webrsync
emerge --ask --verbose --tree --update --deep --newuse --keep-going --with-bdeps=y @world

./update_kernel.sh

emerge --ask --depclean

emerge @preserved-rebuild
