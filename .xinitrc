#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi

disable_touchpad () {
  deviceid=$(xinput list | grep TouchPad | sed -n 's/^.*=\([0-9]\{1,2\}\).*$/\1/p')
  [ -n "$deviceid" ] && xinput --disable "$deviceid"
}

# if `xrandr | grep 'HDMI-1'` &>/dev/null; then
    xrandr --output HDMI-1 --mode 2048x1152
    xrandr --output LVDS-1 --off
    disable_touchpad
# fi

feh --bg-scale "$(random-wallpaper)"

xset -b
xset r rate 200 20
xrdb "$HOME"/.Xresources
systemctl --user restart redshift &

exec i3 &>/dev/null
