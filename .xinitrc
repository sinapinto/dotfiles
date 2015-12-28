#!/bin/sh

xresources=$HOME/.Xresources
fontdir=$HOME/.fonts
# bgdir=$HOME/pictures/GregMartin
bgfile=$HOME/pictures/GregMartin/011_2.jpg

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi

if [ -f "$xresources" ]; then
    xrdb -DFANTASQUE "$xresources"
fi

if [ -d "$fontdir" ]; then
    xset +fp "$fontdir"
    xset fp rehash
fi

xset -b r rate 200 50 m 1 4

setxkbmap -option caps:swapescape

# xsetroot -cursor /usr/include/X11/bitmaps/left_ptr \
#     /usr/include/X11/bitmaps/left_ptrmsk -bg black -fg white

if [ -d "$bgdir" ]; then
    feh -q --bg-scale -z "$bgdir"
elif [ -f "$bgfile" ]; then
    feh -q --bg-scale "$bgfile"
else
    xsetroot -solid \#333
fi

# compton >/dev/null 2>&1 &
unclutter --fork

if [ x"$1" = x ]; then
    exec tfwm 2>>~/wm.log >/dev/null
fi

xbindkeys &
exec "$1" 2>>~/wm.log >/dev/null
