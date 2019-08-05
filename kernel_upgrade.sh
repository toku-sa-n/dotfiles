#!/bin/bash

MAKEOPTS="-j$(nproc||echo 8)"
BACKUP_KERNEL_PATH=$HOME/kernel-config-$(uname -r)
# back up the old kernel config.
sudo cp /usr/src/linux-$(uname -r)/.config $BACKUP_KERNEL_PATH

LATEST_KERNEL_ESELECT_OPTION=$(eselect kernel list|tail -n1|awk '{print $1}'|tr -d '\[\]')

sudo eselect kernel set $LATEST_KERNEL_ESELECT_OPTION

sudo cp /usr/src/linux-$(uname -r)/.config /usr/src/linux/.config

# TODO: use sudo only once.
# use `&&' not to install corrupt kernel.
cd /usr/src/linux && sudo make $MAKEOPTS && sudo make modules_install $MAKEOPTS && sudo make install && sudo genkernel --install initramfs && sudo grub-mkconfig -o /boot/grub/grub.cfg
