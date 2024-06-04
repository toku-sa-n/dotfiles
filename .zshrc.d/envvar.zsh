export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$HOME/cquery/build/release/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.gem/ruby/2.4.0/bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.ghcup/bin:$FLYCTL_INSTALL/bin:$PATH"
export BSTINPUTS=$BSTINPUTS:/usr/share/texmf-dist/pbibtex/bst
export HISTFILE=$HOME/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export GPG_TTY=$(tty)
[[ -r "$HOME/.config/bat/syntaxes/Man.sublime-syntax" ]] && export MANPAGER="sh -c 'sed -e s/.\\\\x08//g|bat -l man -p'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && export FZF_DEFAULT_COMMAND='\find .'
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
