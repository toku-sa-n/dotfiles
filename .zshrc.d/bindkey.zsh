# Use vim-like bindings.
bindkey -v

typeset -A viins_bindings=(
    '^P' up-line-or-history
    '^N' down-line-or-history
    '^F' forward-char
    '^A' beginning-of-line
    '^E' end-of-line
    '^B' backward-char
    '^R' history-incremental-pattern-search-backward
)

for key widget in "${(@kv)viins_bindings}"; do
    bindkey -M viins "$key" "$widget"
done

typeset -A default_bindings=(
    '^[[3~' delete-char
    '^[[H' beginning-of-line
    '^[[F' end-of-line
    '^[.' insert-last-word
    '^[_' insert-last-word
)

for key widget in "${(@kv)default_bindings}"; do
    bindkey "$key" "$widget"
done

unset key widget viins_bindings default_bindings

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
