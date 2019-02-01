#zplug {{{
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "b4b4r07/enhancd",    use:init.sh

if ! zplug check --verbose; then
    printf 'Install?[y/N]:'
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
# }}}
#Colors definition {{{
local DEFAULT=$'%{^[[m%}'$
local RED=$'%{^[[1;31m%}'$
local GREEN=$'%{^[[1;32m%}'$
local YELLOW=$'%{^[[1;33m%}'$
local BLUE=$'%{^[[1;34m%}'$
local PURPLE=$'%{^[[1;35m%}'$
local LIGHT_BLUE=$'%{^[[1;36m%}'$
local WHITE=$'%{^[[1;37m%}'$
# }}}
#Completions {{{
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt interactive_comments
setopt magic_equal_subst

setopt complete_in_word
setopt always_last_prompt

setopt print_eight_bit
setopt extended_glob
setopt globdots

# }}}
# PATH
export PATH="$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin:$PATH:$HOME/.cargo/bin"
export BSTINPUTS=$BSTINPUTS:/usr/share/texmf-dist/pbibtex/bst
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
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh
[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
setopt correct
autoload -Uz colors
colors
#prompt
autoload -Uz vcs_info
precmd_vcs_info(){vcs_info}
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '✚'
zstyle ':vcs_info:git:*' stagedstr '●'
zstyle ':vcs_info:git:*' formats '%b %u%c'
export PROMPT="%(?..%{${fg[red]}Failed:${reset_color}%})[${fg[yellow]}%~${reset_color}]
%#"

#hisotry
setopt hist_ignore_dups
setopt hist_save_no_dups

#noLockScreen
setopt no_flow_control

#auto cd
setopt auto_cd

#ls after cd

#z command
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

#history of cd
setopt auto_pushd
setopt pushd_ignore_dups


#aliases {{{
alias la='ls -aF --color=auto'
alias ll='ls -lahF --color=auto'
alias ls='ls -F --color=auto'
alias ls='exa'
alias l='ls'

alias gcc='gcc -fdiagnostics-color'
alias vi='vim'
alias ...='cd ../..'
alias ....='cd ../../..'
alias scroff='i3lock -c 000000 -e -f -u'
alias untargz='tar -zxvf'
alias fontlist=$'fc-list|awk -F \'[:]\' \'{print $2}\'|sort|uniq|sed \'s/ //\'|less'
alias cdb='cd-bookmark '
alias irb='irb --simple-prompt'

alias -g L='| less'
alias -g G='| grep'

alias less='bat'
alias cat='bat'

alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias zpro="vim ~/.zprofile"
alias xrc="vim ~/.xinitrc"

alias f="fuck"

alias mkdir='(){mkdir $1;cd $1}'

alias find="fd"
# }}}

eval $(thefuck --alias)
chpwd(){
        ls --color=auto
}


#Aliases which depends on the distribution using now{{{

function arch(){
    alias detailpac='pacman -Qi'
    alias ns='sudo netctl start'
    alias inst='sudo pacman -S'
    alias unst='sudo pacman -Rs'
    alias upgr='sudo pacman -Syu'
    alias paclist=$'pacman -Ql|awk -F " " \'{print $1}\'|uniq|less'
}

function gentoo(){
    alias inst='sudo emerge -avt'
    alias unst='sudo emerge -cav'
    alias upgr='sudo emerge-webrsync ; sudo emerge -avtuDU --keep-going --with-bdeps=y @world'
}

function(){
    local dist=`cat /etc/*-release|grep ID|awk -F '[=]' '{print $2}'`
    if  echo $dist | grep -sq 'arch' ; then
        arch
    elif echo $dist |grep -sq 'gentoo' ; then
        gentoo
    fi
}
# }}}
