xset +fp $HOME/.fonts && xset fp rehash
xset -b
xset r rate 200 50
setxkbmap -option caps:swapescape
xsetroot -cursor_name left_ptr -bg black -fg white
xbindkeys &
xrdb -load $HOME/.Xresources
xrdb -merge $HOME/gruvbox.xres

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

[ `pgrep mpd` ] || mpd &>/dev/null
redshift -l 37.3860517:-122.0838511 &> /dev/null &
#[ -s "$HOME/.fehbg" ] && ~/.fehbg || xsetroot -solid \#00161c
feh --bg-scale -z ~/pictures/walls
exec bwm 2> $HOME/bwm.log
