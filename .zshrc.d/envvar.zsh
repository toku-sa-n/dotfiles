export FLYCTL_INSTALL="$HOME/.fly"

export BSTINPUTS=$BSTINPUTS:/usr/share/texmf-dist/pbibtex/bst
export HISTFILE=$HOME/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export GPG_TTY=$(tty)
export WORDCHARS='_'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && export FZF_DEFAULT_COMMAND='\find .'
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh >/dev/null 2>/dev/null
[[ -f $HOME/.elan/env ]] && source $HOME/.elan/env

command -v rbenv 2>&1 >/dev/null && eval "$(rbenv init - --no-rehash zsh)"
command -v jenv 2>&1 >/dev/null && eval "$(jenv init -)"

fpath=(/opt/homebrew/share/zsh/site-functions $HOME/.zshrc.d/zfunc $fpath)
autoload -U compinit
compinit

ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
ZSH_HIGHLIGHT_REGEXP+=('^\s*(\.){2,}$' fg=green,bold)
