for f in zplug.zsh \
    setopt.zsh \
    envvar.zsh \
    bindkey.zsh \
    alias.zsh \
    distro_spec.zsh \
    prompt.zsh \
    autojump.zsh \
    chpwd.zsh
do
    source .zshrc.d/$f
done
