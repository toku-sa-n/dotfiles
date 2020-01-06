#!/bin/bash

set -e

sudo ./upgrade_gentoo.sh

command_exists () {
    command -v $1 > /dev/null
}

command_exists pip && pip list --outdated --format=freeze | awk -F '=' '{print $1}'| xargs pip install --upgrade --user
command_exists zplug && zplug update
command_exists gem && gem update
