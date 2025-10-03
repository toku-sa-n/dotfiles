function load_component() {
    local name=$1
    local src=$HOME/.zshrc.d/$name.zsh
    local obj=$HOME/.zshrc.d/$name.zwc

    if [[ ! -r $obj || $src -nt $obj ]]
    then
        zcompile $src
    fi

    source $src
}

for f in zimrc prompt setopt envvar bindkey alias distro_spec autojump chpwd
do
    load_component $f
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
