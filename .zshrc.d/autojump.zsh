if [[ -r /usr/share/autojump/autojump.zsh ]]; then
    source /usr/share/autojump/autojump.zsh
elif [[ -r /opt/homebrew/etc/profile.d/autojump.sh ]]; then
    source /opt/homebrew/etc/profile.d/autojump.sh
fi
