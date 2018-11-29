#zplug {{{
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "mollifier/cd-bookmark"

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
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
setopt correct
autoload -Uz colors
colors
#prompt
export PROMPT="${bg[green]}%~${reset_color}
%#"

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
