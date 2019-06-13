#!/bin/bash

MAKEOPTS="-j16"
BACKUP_KERNEL_NAME=$HOME/kernel-config-$(uname -r)
# back up an old kernel config.
sudo cp /usr/src/linux/.config $BACKUP_KERNEL_NAME

LATEST_KERNEL_ESELECT_OPTION=$(eselect kernel list|tail -n1|awk '{print $1}'|tr -d '\[\]')

sudo eselect kernel set $LATEST_KERNEL_ESELECT_OPTION

sudo cp $BACKUP_KERNEL_NAME /usr/src/linux/.config

# use parentheses to change working directory temporarily. also use `&&' not to install corrupt kernel.
(cd /usr/src/linux && sudo sh -c $(eval echo "make $MAKEOPTS && make modules_install $MAKEOPTS && make install && genkernel --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg"))
