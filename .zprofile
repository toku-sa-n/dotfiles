export PATH="$HOME/.jenv/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.ghcup/bin:$FLYCTL_INSTALL/bin:/opt/homebrew/bin:$HOME/.elan/bin:$PATH"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    export LANG=ja_JP.UTF-8
    export XMODIFIERS=@im=fcitx
    export QT_IM_MODULE=fcitx
    export GTK_IM_MODULE=fcitx

    exec dbus-run-session sway --unsupported-gpu
fi
