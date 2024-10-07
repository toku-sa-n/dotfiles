export FLYCTL_INSTALL="$HOME/.fly"

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.ghcup/bin:$FLYCTL_INSTALL/bin:$PATH"
[[ -d "/opt/homebrew/bin" ]] && export PATH="/opt/homebrew/bin:$PATH"

export BSTINPUTS=$BSTINPUTS:/usr/share/texmf-dist/pbibtex/bst
export HISTFILE=$HOME/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export GPG_TTY=$(tty)
export WORDCHARS='_'
[[ -r "$HOME/.config/bat/syntaxes/Man.sublime-syntax" ]] && export MANPAGER="sh -c 'sed -e s/.\\\\x08//g|bat -l man -p'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && export FZF_DEFAULT_COMMAND='\find .'
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh >/dev/null 2>/dev/null

fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -U compinit
compinit

ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
ZSH_HIGHLIGHT_REGEXP+=('^\s*(\.){2,}$' fg=green,bold)
