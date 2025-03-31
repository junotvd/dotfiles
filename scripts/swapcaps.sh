#!/usr/bin/env bash

choice=$(printf "swap\nregular" |rofi -dmenu -i -p "ctrl and caplocks keys:" -theme ~/dotfiles/rofi/black-white-selector.rasi)

if [ -z "$choice" ]; then
    exit 1
fi

case "$choice" in
    "swap")
        setxkbmap -layout us -option ctrl:swapcaps
        ;;
    "regular")
        setxkbmap -layout us -option ""
        ;;
esac

exit 0
