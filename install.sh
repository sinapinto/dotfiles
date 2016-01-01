#!/bin/bash

symlink-home-file () {
    for f in "$@"; do
        if [[ ! -f "$PWD"/"$f" ]]; then
            echo "$f" not found
        else
            ln -f -v -s "$PWD"/"$f" "$HOME"/"$f"
        fi
    done
}

symlink-home-dir () {
    for f in "$@"; do
        mkdir -v -p "$HOME"/"${f%/*}"
        if [[ ! -f "$PWD"/"$f" ]]; then
            echo "$f" not found
        else
            ln -f -v -s "$PWD"/"$f" "$HOME"/"$f"
        fi
    done
}

symlink-xdg-file () {
    mkdir -v -p "$XDG_CONFIG_HOME"
    for f in "$@"; do
        if [[ ! -f "$PWD"/.config/"$f" ]]; then
            echo "$f" not found
        else
            ln -f -v -s "$PWD"/.config/"$f" "$XDG_CONFIG_HOME"/"$f"
        fi
    done
}

symlink-xdg-dir () {
    for f in "$@"; do
        mkdir -v -p "$XDG_CONFIG_HOME"/"${f%/*}"
        if [[ ! -f "$PWD"/.config/"$f" ]];then
            echo "$f" not found
        else
            ln -f -v -s "$PWD"/.config/"$f" "$XDG_CONFIG_HOME"/"$f"
        fi
    done
}

symlink-home-file .agignore \
    .dir_colors \
    .rtorrent.rc \
    shell_aliases \
    shell_functions \
    .tmux.conf \
    .vimrc \
    .xinitrc \
    .Xresources \
    .zshenv \
    .zlogin \
    .zshrc

symlink-home-dir .ncmpcpp/config \
    .ncmpcpp/bindings \
    .mpd/mpd.conf

if [[ -z "$XDG_CONFIG_HOME" ]]; then
    $XDG_CONFIG_HOME="$HOME/.config"
fi

symlink-xdg-file compton.conf \
    redshift.conf

symlink-xdg-dir dunst/dunstrc \
    git/config \
    htop/htoprc \
    mpv/input.conf \
    systemd/user/dunst.service \
    systemd/user/redshift.service \
    systemd/user/ssh-agent.service \
    systemd/user/mpd.service \
    systemd/user/unclutter.service \
    termite/config
