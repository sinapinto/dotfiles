#!/bin/bash

xset +fp $HOME/.fonts && xset fp rehash
xset -b
xset r rate 200 50
setxkbmap -option caps:swapescape
xsetroot -cursor_name left_ptr -bg white -fg black
xbindkeys &
xrdb -load $HOME/.Xresources
xrdb -merge $HOME/gruvbox.xres

pgrep dunst >/dev/null     || dunst -key q -to 3 &
pgrep mpd >/dev/null       || mpd &>/dev/null
pgrep redshift >/dev/null  || redshift -t 4500K:3500K &> /dev/null &

feh --bg-scale -z ~/pictures/walls

bwm 2> $HOME/bwm.log
