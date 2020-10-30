#!/bin/zsh

set -e

if [[ $(whoami) != "root" ]]; then
    echo "Run as root." >&2
    exit 1
fi

# if only one version of linux kernel is available, exit.
if [[ $(eselect kernel list|wc -l) == 2 ]]; then
    exit 0
fi

readonly BACKUP_KERNEL_PATH=$HOME/kernel-config-$(uname -r)
readonly OLD_KERNEL_PATH=/usr/src/linux-$(uname -r)

# back up the old kernel config.
cp $OLD_KERNEL_PATH/.config $BACKUP_KERNEL_PATH

readonly LATEST_KERNEL_ESELECT_OPTION=$(eselect kernel list|tail -n1|awk '{print $1}'|tr -d '\[\]')

eselect kernel set $LATEST_KERNEL_ESELECT_OPTION

readonly NEW_KERNEL_PATH=/usr/src/linux
cp {$OLD_KERNEL_PATH,$NEW_KERNEL_PATH}/.config

readonly MAKEOPTS="-j$(nproc||echo 8)"
cd $NEW_KERNEL_PATH && make $MAKEOPTS && make modules_install $MAKEOPTS && make install && genkernel --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg

# Save the installed kernel and the current one.
eclean-kernel -n 2
