#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi

command -v xrdb >/dev/null 2>&1 && {
    [ -f "$HOME"/.Xresources ] && xrdb "$HOME"/.Xresources
}

command -v xsetroot >/dev/null 2>&1 && {
    # pick a random dark color from xrdb
    # supports hex, rgb, or X11 color name, but not rgba
    color=$(xrdb -query | grep 'color[0-9]:' | awk '{print $2}' | sort -R | head -n1)

    [ -n "$color" ] && xsetroot -solid "$color" \
                    || xsetroot -solid \#333
}

exec ${1:-tfwm} 2>>~/wm.log >/dev/null
