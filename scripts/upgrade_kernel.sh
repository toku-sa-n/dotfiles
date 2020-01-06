#!/bin/bash

set -e

if [[ $(whoami) != "root" ]]; then
    echo "Run as root." >&2
    exit 1
fi

# if only one version of linux kernel is available, exit.
if [[ $(eselect kernel list|wc -l) == 2 ]]; then
    exit 0
fi

MAKEOPTS="-j$(nproc||echo 8)"
BACKUP_KERNEL_PATH=$HOME/kernel-config-$(uname -r)
# back up the old kernel config.
cp /usr/src/linux-$(uname -r)/.config $BACKUP_KERNEL_PATH

LATEST_KERNEL_ESELECT_OPTION=$(eselect kernel list|tail -n1|awk '{print $1}'|tr -d '\[\]')

eselect kernel set $LATEST_KERNEL_ESELECT_OPTION

cp /usr/src/linux-$(uname -r)/.config /usr/src/linux/.config

cd /usr/src/linux && make $MAKEOPTS && make modules_install $MAKEOPTS && make install && genkernel --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg
