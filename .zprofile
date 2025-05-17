if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    export LANG=ja_JP.UTF-8

    exec dbus-run-session sway --unsupported-gpu
fi
