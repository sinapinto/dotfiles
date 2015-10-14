#!/bin/bash

xset +fp ~/.fonts && xset fp rehash
xset -b
xset r rate 200 50
xset m 1 4
setxkbmap -option caps:swapescape
xsetroot -cursor_name
xbindkeys &
xrdb -load ~/.Xresources
xrdb -merge ~/gruvbox.xres

pgrep dunst >/dev/null     || dunst -key q &
pgrep mpd >/dev/null       || mpd &>/dev/null
pgrep redshift >/dev/null  || nohup redshift -t 4000K:3000K &> /dev/null &

feh --bg-scale -z ~/pictures/skeeto

exec bwm 2> ~/bwm.log
