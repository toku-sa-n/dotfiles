#!/bin/bash

# Immediately abort to run this script when an error occurs.
set -e

if [[ $(whoami) != "root" ]]; then
    echo 'Run as root.'
    exit 1
fi

emerge-webrsync
emerge --ask --verbose --tree --update --deep --newuse --keep-going --with-bdeps=y @world

# $HOME is not the home directory of the user who runs sudo.
# I hate direct path so copied kernel_upgrade.sh.

# if only one version of Linux kernel is available, exit.
if [[ $(eselect kernel list|wc -l) != 2 ]]; then

    MAKEOPTS="-j$(nproc||echo 8)"
    BACKUP_KERNEL_PATH=$HOME/kernel-config-$(uname -r)
    # back up the old kernel config.
    cp /usr/src/linux-$(uname -r)/.config $BACKUP_KERNEL_PATH

    LATEST_KERNEL_ESELECT_OPTION=$(eselect kernel list|tail -n1|awk '{print $1}'|tr -d '\[\]')

    eselect kernel set $LATEST_KERNEL_ESELECT_OPTION

    cp /usr/src/linux-$(uname -r)/.config /usr/src/linux/.config

    # use `&&' not to install corrupt kernel.
    cd /usr/src/linux && make $MAKEOPTS && make modules_install $MAKEOPTS && make install && genkernel --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg
fi

emerge --ask --depclean

emerge @preserved-rebuild

# $HOME is "root's" home directory so non-system-wise upgrade can't be run.

# command -v pip > /dev/null && pip list --outdated --format=freeze | awk -F '=' '{print $1}' | xargs pip install --upgrade --user
# command -v zplug > /dev/null && zplug update
# command -v gem > /dev/null && gem update
