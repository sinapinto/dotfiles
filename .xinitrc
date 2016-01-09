#!/bin/sh

resources="$HOME"/.Xresources
bgfill="#025D8C"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi

command -v xrdb >/dev/null 2>&1 && {
    [ -f "$resources" ] &&  xrdb -I"$HOME" "$resources"
} || echo "no xrdb"

command -v xsetroot >/dev/null 2>&1 && {
    xsetroot -solid "$bgfill"
} || echo "no xsetroot"

if [ x"$1" = x ]; then
    exec tfwm 2>>~/wm.log >/dev/null
fi

command -v xbindkeys >/dev/null 2>&1 && {
    xbindkeys &
} || echo "no xbindkeys"
exec "$1" 2>>~/wm.log >/dev/null
