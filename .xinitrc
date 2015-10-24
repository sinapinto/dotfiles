#!/bin/sh

feh --bg-tile ~/pictures/tile/irongrip.png

xset +fp ~/.fonts -b r rate 200 50 m 1 4
xset fp rehash
xrdb -load ~/.Xresources
setxkbmap -option caps:swapescape
# xmodmap ~/.Xmodmap
xbindkeys &

pgrep ssh-agent >/dev/null || eval `/usr/bin/ssh-agent`
pgrep dunst >/dev/null     || dunst &
pgrep mpd >/dev/null       || mpd
pgrep redshift >/dev/null  || nohup redshift &

exec tfwm 2> ~/wm.log
