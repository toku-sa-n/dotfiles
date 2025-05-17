if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    export LANG=ja_JP.UTF-8
    export XMODIFIERS=@im=fcitx
    export QT_IM_MODULE=fcitx
    export GTK_IM_MODULE=fcitx

    exec dbus-run-session sway --unsupported-gpu
fi
