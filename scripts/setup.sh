#!/usr/bin/env bash

OPTION=$(echo -e "monitor\nkeys\nwallpaper" | rofi -dmenu -i -p "hoorcolleges of oefenzittingen" -theme $HOME/dotfiles/rofi/black-white-selector.rasi)

case "$OPTION" in
    "keys")
        exec $HOME/dotfiles/scripts/swapcaps.sh
        ;;
    "monitor")
        exec $HOME/dotfiles/scripts/select-display.sh
        ;;
    "wallpaper")
        exec $HOME/dotfiles/scripts/wallpaper.sh
        ;;
esac
