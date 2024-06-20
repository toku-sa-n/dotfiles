for f in \
    zplug.zsh \
    prompt.zsh \
    setopt.zsh \
    envvar.zsh \
    bindkey.zsh \
    alias.zsh \
    distro_spec.zsh \
    autojump.zsh \
    chpwd.zsh
do
    source $HOME/.zshrc.d/$f
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
