#!/bin/bash

monoscreen() {
    local display="$1"

    available_rates=$(xrandr --verbose | grep -A 1 "^$display" | awk '/[0-9]+\.[0-9]+/ {print $1}' | sort -u)

    if [ -z "$available_rates" ]; then
        available_rates="60\n120"
    fi

    rate=$(echo -e "$available_rates" | rofi -dmenu -i -p "Select refresh rate for $display:" -theme ~/dotfiles/rofi/black-white-selector.rasi)

    [ -z "$rate" ] && exit 1

    resolution=$(xrandr | grep -A1 "^$display" | awk '/\*/ {print $1}')

    xrandr --output "$display" --mode "$resolution" --rate "$rate" --scale 1x1
    exit 0
}

mirrorscreen() {
    monoscreen "$1"
    xrandr --output "$2" --auto --same-as "$1" --scale 0.75x0.75
}

screens=$(xrandr --listmonitors | awk 'NR>1 {print $4}')

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
