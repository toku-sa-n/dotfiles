#!/bin/zsh

set -e

if (( EUID != 0 )); then
    echo 'Run as root.' >&2
    exit 1
fi

for cmd in eix-sync emerge eclean-kernel; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "command not found: $cmd" >&2
        exit 127
    fi
done
unset cmd

eix-sync
command -v haskell-updater >/dev/null 2>&1 && haskell-updater
emerge --ask --verbose --tree --update --deep --newuse --keep-going --with-bdeps=y @world

emerge --ask --depclean
eclean-kernel -n 2

emerge @preserved-rebuild
