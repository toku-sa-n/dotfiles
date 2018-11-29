#aliases {{{
alias la='ls -aF --color=auto'
alias ll='ls -lahF --color=auto'
alias ls='ls -F --color=auto'
alias gcc='gcc -fdiagnostics-color'
alias vi='vim'
alias ...='cd ../..'
alias ....='cd ../../..'
alias scroff='xset dpms force off && i3lock -c 000000 -e -f -u'
alias untargz='tar -zxvf'
alias fontlist=$'fc-list|awk -F \'[:]\' \'{print $2}\'|sort|uniq|sed \'s/ //\'|less'
alias cdb='cd-bookmark '

alias -g L='| less'
alias -g G='| grep'
# }}}

#Background
~/.background.sh

#Depends on the distribution using now

function arch(){
    alias detailpac='pacman -Qi'
    alias ns='sudo netctl start '
    alias inst='sudo pacman -S '
    alias unst='sudo pacman -Rs '
    alias upgr='sudo pacman -Syu'
    alias paclist=$'pacman -Ql|awk -F " " \'{print $1}\'|uniq|less'
}

function(){
    local dist=`cat /etc/*-release|grep ID|awk -F '[=]' '{print $2}'`
    if  echo $dist | grep -sq 'arch' ; then
        arch
    fi
}
