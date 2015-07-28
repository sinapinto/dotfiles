#!/bin/bash

xset +fp $HOME/.fonts && xset fp rehash
xset -b
xset r rate 200 50
setxkbmap -option caps:swapescape
xsetroot -cursor_name left_ptr -bg white -fg black
xbindkeys &
xrdb -load $HOME/.Xresources
xrdb -merge $HOME/gruvbox.xres

pgrep dunst >/dev/null     || dunst -key q &
pgrep mpd >/dev/null       || mpd &>/dev/null
pgrep redshift >/dev/null  || redshift -l 37:-122 > /dev/null &

feh --bg-scale -z ~/pictures/skeeto

exec bwm 2> $HOME/bwm.log
