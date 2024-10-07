gentoo(){
    alias inst='sudo emerge -avt'
    alias unst='sudo emerge -cav'
}

# An anonymous function is used to hide the `dist` variable.
(){
    readonly local dist=$(cat /etc/*-release|grep '^ID'|awk -F '[=]' '{print $2}')

    case $dist in
        "gentoo" ) gentoo;;
    esac
}

