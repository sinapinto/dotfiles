xset +fp /home/veggie/.fonts
xset fp rehash
xset -b
xset r rate 200 50
xsetroot -cursor_name left_ptr
setxkbmap -option caps:swapescape
xrdb -merge $HOME/.Xresources
xbindkeys &
#~/.fehbg

if [[ -z "$1" ]]; then
    xsetroot -solid \#00161c
    exec dwm
fi

# vi:syntax=sh
