#!/usr/bin/env bash

monoscreen() {

    if [ "$1" = "eDP" ]; then
        rate=$(printf "60\n120" | rofi -dmenu -i -p "refresh rate:" \
            -theme ~/dotfiles/rofi/black-white-selector.rasi)

        [ -z "$rate" ] && exit 1

        xrandr --output eDP --mode 2880x1920 --auto --rate "$rate" --scale 1x1
        exit 0
    fi

    resolution=$(xrandr | grep -A1 "^$1" | awk '/\*/ {print $1}')

    xrandr --output "$1" --mode "$resolution" --rate "$rate" --scale 1x1
    exit 0
}

mirrorscreen() {
    monoscreen "$1"
    xrandr --output "$2" --auto --same-as "$1" --scale 0.75x0.75
}

screens=$(xrandr | grep " connected" | awk '{print $1}')

screen_count=$(echo "$screens" | wc -l)

if [ "$screen_count" -lt 2 ]; then
    primary_screen=$(echo "$screens" | head -n1)
    monoscreen "$primary_screen"
    rofi -e "Only one available screen"
    exit
fi

selected=$(echo "$screens" | rofi -dmenu -i -p "Select screen:" -theme ~/dotfiles/rofi/black-white-selector.rasi)

[ -z "$selected" ] && exit 1

other=$(echo "$screens" | grep -v "^$selected")

if [ -z "$other" ]; then
    rofi -e "No other monitor detected"
    exit 1
fi

mirror=$(printf "no\nyes" | rofi -dmenu -i -p "Mirror $selected onto $other?" -theme ~/dotfiles/rofi/black-white-selector.rasi)

if [ "$mirror" = "yes" ]; then
    mirrorscreen "$selected" "$other"
    exit
fi

xrandr --output "$selected" --auto
xrandr --output "$other" --off
