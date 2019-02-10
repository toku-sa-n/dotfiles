#!/bin/bash

readonly INSTALL_PACKAGE='sudo gentoo -avt'
readonly CALL_TO_PACKAGE_DATABASE='pacman -Qs'
readonly UPDATE_PACKAGE_DATABASE='sudo pacman -Sy'

./run_as_normal_check.sh

exit_status=$?
if [ $? -ne 0 ]; then
    exit 1
fi

$UPDATE_PACKAGE_DATABASE

# Install packages.

install_packages_pacman=''
install_packages_aur=()         # Because you can't install all packages you need compactly by makepkg, declare an array, then iterate.
while read install_code
do

    install_method_name=$(echo $install_code|awk '{print $1}')
    package_name=$(echo $install_code|awk '{print $2}')

    if [ install_method_name = "gem" ]; then
        gem install $package_name
        continue
    fi

    # confirm whether the package is installed or not.
    $CALL_TO_PACKAGE_DATABASE $package_name >/dev/null 2>/dev/null
    return_value=$?

    if [ $return_value -ne 0 ]; then
        if [ install_method_name = "pacman" ]; then
            install_packages_pacman+="$package_name"
        else
            aur_install_url=$(echo $install_code|awk '{print $3}')
            install_packages_aur+=($aur_install_url)
        fi
    fi
done < 'arch'

# Install packages by AUR.
cd ~
mkdir -v aur && cd aur
for package_url in "${$install_packages_aur[@]}"
do
    git clone $package_url
    cd "$(basename $package_url .git)"
    makepkg -sirc
    cd ..
done
cd ~

# Install packages by Pacman.
$INSTALL_PACKAGE $install_packages_pacman
