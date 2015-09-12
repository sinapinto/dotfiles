#!/bin/bash
# do stuff when a torrent finishes downloading
# $1 = path; $2 = name

notify-send -t 3000 "$2"

if [[ -n $(find "$1" -iname '*.mp3' -or -iname '*.m4a' -or -iname '*.flac') ]]
then
    [ -d "$HOME/music" ] && mv "$1" $HOME/music
    mpc -q --wait update
    mpc -q random off
    mpc ls "$2" | mpc insert 2>/dev/null
elif [[ -n $(find "$1" -iname '*.pdf' -or -iname '*.epub') ]]
then
    [ -d "$HOME/books" ] && mv "$1" $HOME/books
fi
