# Use vim-like bindings.
bindkey -v

bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^F' forward-char
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^R' history-incremental-pattern-search-backward

bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[.' insert-last-word
bindkey '^[_' insert-last-word

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
