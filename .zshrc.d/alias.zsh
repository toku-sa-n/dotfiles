alias la='ls -aF --color=auto'
alias ll='ls -lahF --color=auto'
alias ls='ls -F --color=auto --group-directories-first'
alias l='ls'

alias df='df -h'
alias gcc='gcc -Ofast -pipe -march=native -fdiagnostics-color'
alias vi='vim'
alias scroff='i3lock -c 000000 -e -f -u'
alias untargz='tar -zxvf'
alias fontlist=$'fc-list|awk -F \'[:]\' \'{print $2}\'|sort|uniq|sed \'s/ //\'|less'
alias irb='irb --simple-prompt'
alias grep='grep --color'
alias ping='ping -c3'

alias -g L='| less'
alias -g G='| grep'
alias -g F=' $(fzf)'

# See https://github.com/ohmyzsh/ohmyzsh/issues/10925 for why `&>/dev/null &|` is needed.
[ -x "$(command -v wl-copy)" ] && alias -g C='| { wl-copy &>/dev/null &| }'
[ -x "$(command -v clipboard)" ] && alias -g C='| { clipboard &>/dev/null &| }'

alias vrc="vim $HOME/.vimrc"
alias zrc="vim $HOME/.zshrc"
alias zpro="vim $HOME/.zprofile"
alias xrc="vim $HOME/.xinitrc"

alias ga="git add"
alias gb="git branch"
alias gbd="git branch --delete"
alias gc="git commit"
alias gck="git checkout"
alias gckb="git checkout -b"
alias gd="git diff"
alias gm="git merge"
alias gp="git push"
alias gpf="git push --force"
alias gpa="git push --all"
alias gpl="git pull"
alias gl="git log --graph --all"
alias gst="git status"  # gs command already exists. It will run GhostScript tool.
alias gsw="git switch"
alias gswc="git switch -c"
alias grt="git restore"
alias gr="git rebase"
alias grm="git rebase main"
alias grc="git rebase --continue"
alias cpr="gh pr create"

[ -x "$(command -v bat)" ] && alias cat='bat' && alias less='bat'
[ -x "$(command -v fuck)" ] && eval $(thefuck --alias) && alias f="fuck"
[ -x "$(command -v eza)" ] && alias ls='eza --group-directories-first'
[ -x "$(command -v fd)" ] && alias find="fd"
[ -x "$(command -v ack)" ] && alias grep='ack'
[ -x "$(command -v fzf)" ] && alias vf='vim $(fzf)'

alias :q='exit'

odp(){
    objdump --disassemble --demangle --disassembler-options=intel $1 | bat --language asm --style plain
}

gsq(){
    git reset $(git merge-base $1 $(git branch --show-current))
}

if command -v jenv >/dev/null 2>&1
then
    jenv(){
        unfunction jenv
        eval "$(command jenv init -)"
        jenv "$@"
    }
fi

if command -v rbenv >/dev/null 2>&1
then
    rbenv(){
        unfunction rbenv
        eval "$(command rbenv init - --no-rehash zsh)"
        rbenv "$@"
    }
fi
