#!/bin/bash

xset +fp ~/.fonts && xset fp rehash
xset -b
xset r rate 200 50
xset m 1 4
setxkbmap -option caps:swapescape
xsetroot -cursor_name left_ptr -bg black -fg white
xbindkeys &
xrdb -load ~/.Xresources
xrdb -merge ~/tomorrow.xres

pgrep dunst >/dev/null     || dunst -key q -to 3 &
pgrep mpd >/dev/null       || mpd &>/dev/null
pgrep redshift >/dev/null  || nohup redshift -t 4500K:3500K &> /dev/null &

# feh --bg-scale -z ~/pictures/walls
feh --bg-scale ~/pictures/walls/322925.jpg

bwm 2> ~/bwm.log
