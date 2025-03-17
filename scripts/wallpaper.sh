#!/bin/bash

OPTION=$(echo -e "on\noff" | rofi -dmenu -i -p "hoorcolleges of oefenzittingen" -theme $HOME/dotfiles/rofi/black-white-selector.rasi)

if [ -z "$OPTION" ]; then
    exit 1
fi

case "$OPTION" in
    "on")
        exec $HOME/.fehbg
        ;;
    "off")
        xsetroot
        ;;
esac
