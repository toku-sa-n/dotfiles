#!/bin/bash

set -e

if [[ $(whoami) = "root" ]]; then
    echo "Run as non-root. Root user can't update non-systemwide packages such as pip, zplug, gem, etc." >&2
    exit 1
fi

sudo ./upgrade_gentoo.sh

command_exists () {
    command -v $1 > /dev/null
}

command_exists pip && pip list --outdated --format=freeze | awk -F '=' '{print $1}'| xargs pip install --upgrade --user
command_exists zplug && zplug update
command_exists gem && gem update
