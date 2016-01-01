#!/bin/sh

xresources=$HOME/.Xresources
fontdir=$HOME/.fonts

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi

if [ -f "$xresources" ]; then
    xrdb -I"$HOME" -DFANTASQUE "$xresources"
fi

if [ -d "$fontdir" ]; then
    xset +fp "$fontdir"
    xset fp rehash
fi

xset -b r rate 220 50 m 1 4
setxkbmap -option caps:swapescape
xsetroot -solid \#025D8C

if [ x"$1" = x ]; then
    exec tfwm 2>>~/wm.log >/dev/null
fi

xbindkeys &
exec "$1" 2>>~/wm.log >/dev/null
