#!/bin/bash

# This script is made for single monitor use

monoscreen() {

    if [ "$1" = "eDP" ]; then
        rate=$(printf "60\n120" | rofi -dmenu -i -p "refresh rate:" \
            -theme ~/dotfiles/rofi/black-white-selector.rasi)
        { xrandr --output eDP --mode 2880x1920 --rate "$rate" --scale 1x1; exit; }

        if [ -n "$rate" ]; then
            xrandr --output eDP --mode 2880x1920 --rate "$rate" --scale 1x1
            exit 1
        fi
    fi

    xrandr --output "$1" --auto --scale 1x1
}

mirrorscreen() {
    monoscreen "$1"
    xrandr --output "$2" --auto --same-as "$1" --scale 0.75x0.75
}

screens=$(xrandr -q | grep "connected" | awk '/ connected/ {print $1}')

[ "$(printf "$screens" | wc -l)" -lt 2 ] &&
{ monoscreen "$screens"; rofi -e "only one available screen"; exit; }

selected=$(printf "$screens" | rofi -dmenu -i -p "select screen" -theme ~/dotfiles/rofi/black-white-selector.rasi)
other=$(printf "$screens" | grep -v "^$selected")
mirror=$(printf "no\nyes" | rofi -dmenu -i -p "want to mirror $selected onto $other?" -theme ~/dotfiles/rofi/black-white-selector.rasi)

[ "$mirror" = "yes" ] &&
    { mirrorscreen $selected $other; exit; }


xrandr --output  "$selected" --auto && xrandr --output "$other" --off
