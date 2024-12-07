#!/bin/sh

LANG="ja_JP.UTF-8"

eval "$(dbus-launch --sh-syntax --exit-with-session)"

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
        xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
        xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
        xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
        xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
        for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx
fcitx5 &
urxvtd -o -f

# export
export EDITOR=vim
export VISUAL=vim
export TERMINAL=urxvtc

# dropbox
[ -e $HOME/.dropbox-dist/dropboxd ] && $HOME/.dropbox-dist/dropboxd &

# autolock
xautolock -time 5 -locker 'i3lock -f; loginctl suspend' &

# -b: compton runs as a daemon.
picom -b
hsetroot -solid "#000000"

source ~/.xprofile

# Do not launch i3 with `dbus-launch`.
#
# ```sh
# exec dbus-launch --exit-with-session i3
# ```
#
# Otherwise, fcitx will not be able to connect to dbus, and fcitx-configtool will not show any keyboard layouts.
exec i3


