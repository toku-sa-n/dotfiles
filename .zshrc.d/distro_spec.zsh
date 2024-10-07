if [[ -f /etc/gentoo-release ]]; then
    alias inst='sudo emerge -avt'
    alias unst='sudo emerge -cav'
fi
