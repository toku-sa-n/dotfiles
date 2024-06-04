# fugitive.vim doesn't work well with symlinks. Working directory must have .git directory.
vim_expand_symlinks () {
    args=()
    for i in $@; do
        if [[ -h $i ]]; then
            args+=$(readlink -f $i)
        else
            args+=$i
        fi
    done

    \vim "${args[@]}"
}
alias vim="vim_expand_symlinks"

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
alias hs="hub sync"

alias v=vim

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
