#!/bin/bash
# do stuff when a torrent finishes downloading
# $1 = path; $2 = name

notify-send "$2"

if [[ -n $(find "$1" -iname '*.mp3' -or -iname '*.m4a' -or -iname '*.flac') ]]
then
    [ -d "$HOME/music" ] && mv "$1" $HOME/music
    mpc -q --wait update
    mpc -q random off
    mpc ls "$2" | mpc add 2>/dev/null
elif [[ -n $(find "$1" -iname '*.pdf' -or -iname '*.epub') ]]
then
    [ -d "$HOME/books" ] && mv "$1" $HOME/books
fi
