xset +fp /home/veggie/.fonts
xset fp rehash
xset -b
xset r rate 200 50
xsetroot -cursor_name left_ptr
setxkbmap -option caps:swapescape
xrdb -merge $HOME/.Xresources
xbindkeys &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [[ -z "$1" ]]; then
    xsetroot -solid \#1c1c1c
    exec dwm
fi

# vi:syntax=sh
