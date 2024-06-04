arch(){
    alias detailpac='pacman -Qi'
    alias ns='sudo netctl start'
    alias inst='sudo pacman -S'
    alias unst='sudo pacman -Rs'
    alias upgr='yes|sudo pacman -Syu && common_upgr'
    alias paclist=$'pacman -Ql|awk -F " " \'{print $1}\'|uniq|less'
}

gentoo(){
    alias inst='sudo emerge -avt'
    alias unst='sudo emerge -cav'
}

# An anonymous function is used to hide the `dist` variable.
(){
    readonly local dist=$(cat /etc/*-release|grep '^ID'|awk -F '[=]' '{print $2}')

    case $dist in
        "arch" ) arch ;;
        "gentoo" ) gentoo;;
    esac
}

