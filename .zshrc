#zplug {{{
source ~/.zplug/init.zsh

where zplug>/dev/null
is_zplug_installed=$?
if [ is_zplug_installed -ne 0 ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi


zplug "zsh-users/zsh-autosuggestions"

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
#setout{{{
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
setopt correct
setopt prompt_subst
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt no_flow_control
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
# }}}
#Environment paths{{{
export PATH="$HOME/.local/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.gem/ruby/2.4.0/bin:$HOME/.cargo/bin:$PATH"
export BSTINPUTS=$BSTINPUTS:/usr/share/texmf-dist/pbibtex/bst
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
#}}}
#sources{{{
#z command
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh#
[[ -r "/etc/profile.d/cnf.sh" ]] && . /etc/profile.d/cnf.sh
[[ -r "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#}}}
#autoload{{{
#compinit{{{
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
#}}}
autoload -U promptinit
promptinit
autoload -Uz colors
colors
# }}}
#bindkey{{{
bindkey -v

bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^F' forward-char
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^R' history-incremental-pattern-search-backward
#}}}
#prompt{{{

function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd)
            mode_indication="--- Normal ---"
            ;;
        main|viins)
            mode_indication="--- Insert ---"
            ;;
    esac
    export PROMPT="%(?..%{${fg[red]}Failed:${reset_color}%})[${fg[yellow]}%~${reset_color}] $mode_indication
%#"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
autoload -Uz vcs_info
precmd_vcs_info(){vcs_info}
precmd_functions+=( precmd_vcs_info )
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '✚'
zstyle ':vcs_info:git:*' stagedstr '●'
zstyle ':vcs_info:git:*' formats '%b %u%c'
# }}}
#aliases {{{
alias la='ls -aF --color=auto'
alias ll='ls -lahF --color=auto'
alias ls='ls -F --color=auto'
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
alias grep='grep --color'

alias -g L='| less'
alias -g G='| grep'


alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias zpro="vim ~/.zprofile"
alias xrc="vim ~/.xinitrc"


alias mkdir='(){mkdir $1;cd $1}'

[ -r /usr/bin/bat ] && alias cat='bat' && alias less='bat'
[ -r /usr/bin/fuck ] && alias f="fuck"
[ -r /usr/bin/exa ] && alias ls='exa'
[ -r /usr/bin/fd ] && alias find="fd"

alias :q='exit'
chpwd(){
        ls --color=auto
}
# }}}
#Aliases which depends on the distribution using now{{{

function arch(){
    alias detailpac='pacman -Qi'
    alias ns='sudo netctl start'
    alias inst='sudo pacman -S'
    alias unst='sudo pacman -Rs'
    alias upgr='yes|sudo pacman -Syu'
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
