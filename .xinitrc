#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi

disable_touchpad () {
  local deviceid=$(xinput | grep TouchPad | cut -d "=" -f2| cut -f1)
  [ -z "$deviceid" ] && return 1
  val=$(xinput list-props "$deviceid" | grep able | tail -c 2)
  xinput --disable "$deviceid"
}

# if `xrandr | grep 'HDMI-1'` &>/dev/null; then
    xrandr --output HDMI-1 --mode 2048x1152
    xrandr --output LVDS-1 --off
    disable_touchpad
# fi

feh --bg-scale "$(random-wallpaper)"

xset -b
xrdb "$HOME"/.Xresources
systemctl --user restart redshift &

exec i3 &>/dev/null
