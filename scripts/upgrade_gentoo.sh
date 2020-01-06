#!/bin/bash

# Immediately abort to run this script when an error occurs.
set -e

if [[ $(whoami) != "root" ]]; then
    echo 'Run as root.' >&2
    exit 1
fi

emerge-webrsync
emerge --ask --verbose --tree --update --deep --newuse --keep-going --with-bdeps=y @world

./upgrade_kernel.sh

emerge --ask --depclean

emerge @preserved-rebuild

# $HOME is "root's" home directory so non-system-wise upgrade can't be run.

# command -v pip > /dev/null && pip list --outdated --format=freeze | awk -F '=' '{print $1}' | xargs pip install --upgrade --user
# command -v zplug > /dev/null && zplug update
# command -v gem > /dev/null && gem update
