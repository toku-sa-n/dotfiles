tty=$(tty|cut -b10-)
[[ -z $DISPLAY && ! $tty -eq 1 ]] && exec startx
