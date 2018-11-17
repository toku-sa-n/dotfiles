# PATH
export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U promptinit
promptinit
source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
setopt correct
autoload -Uz colors
colors
#prompt
export PROMPT="${bg[green]}%~${reset_color}
%#"

#alias
alias la='ls -F -a --color=auto'
alias ll='ls -F -la --color=auto'
alias llh='ls -F -lah --color=auto'
alias ls='ls -F --color=auto'
alias gcc='gcc -fdiagnostics-color'
alias vi='vim'
alias ...='cd ../..'
alias ....='cd ../../..'
alias scroff='xset dpms force off && i3lock -c 000000 -e -f -u'
alias inst='sudo pacman -S '
alias unst='sudo pacman -Rs '
alias upgr='sudo pacman -Syu'
alias paclist=$'pacman -Ql|awk -F " " \'{print $1}\'|uniq|less'
alias untargz='tar -zxvf'
alias detailPac='pacman -Qi'
alias ns='sudo netctl start '
alias fontlist=$'fc-list|awk -F \'[:]\' \'{print $2}\'|sort|uniq|less'

#hisotry
setopt hist_ignore_dups
setopt hist_save_no_dups

#noLockScreen
setopt no_flow_control

#auto cd
setopt auto_cd

#ls after cd
chpwd(){
        ls --color=auto
}

#history of cd
setopt auto_pushd
setopt pushd_ignore_dups

#Depends on the distribution using now
function(){
    local dist=`cat /etc/*-release|grep ID|awk -F '[=]' '{print $2}'`
    if  echo $dist | grep -sq 'arch' ; then
        echo 'ok'
    fi
}
