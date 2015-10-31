#!/bin/sh

xset +fp ~/.fonts -b r rate 200 50 m 1 4
xset fp rehash
xrdb -load ~/.Xresources
setxkbmap -option caps:swapescape
xsetroot -cursor_name left_ptr
xbindkeys &
feh --bg-scale -z ~/pictures/skeeto
pgrep compton >/dev/null   || compton &
pgrep ssh-agent >/dev/null || eval `/usr/bin/ssh-agent`
pgrep redshift >/dev/null  || nohup redshift &
pgrep dunst >/dev/null     || dunst &
pgrep mpd >/dev/null       || mpd
exec tfwm
