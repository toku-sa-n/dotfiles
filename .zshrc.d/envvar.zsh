export FLYCTL_INSTALL="$HOME/.fly"

export BSTINPUTS=$BSTINPUTS:/usr/share/texmf-dist/pbibtex/bst
export HISTFILE=$HOME/.histfile
export HISTSIZE=50000
export SAVEHIST=50000
export GPG_TTY=$(tty)
export WORDCHARS='_'

if [[ -z $PAGER ]]; then
    if (( ${+commands[less]} )); then
        export PAGER=less
    else
        export PAGER=more
    fi
fi
export LESS=${LESS:---ignore-case --jump-target=4 --LONG-PROMPT --no-init --quit-if-one-screen --RAW-CONTROL-CHARS}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && export FZF_DEFAULT_COMMAND='\find .'
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh >/dev/null 2>/dev/null
[[ -f $HOME/.elan/env ]] && source $HOME/.elan/env

fpath=(/opt/homebrew/share/zsh/site-functions $HOME/.zshrc.d/zfunc $fpath)
