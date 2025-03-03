#!/bin/bash

DIRS=(
    ~/
    ~/uni/
    ~/uni/bachelor-1/
    ~/uni/bachelor-1/semester-1/
    ~/uni/bachelor-1/semester-2/
    ~/coding/
    ~/Documents/
    ~/repos
    ~/suckless/
    ~/uni/bachelor-1/semester-1/calculus-1/lesmateriaal/
)

SEARCH_DIRS=$(find "${DIRS[@]}" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sed "s|$HOME|~|")
CHOSEN_DIR=$(echo "$SEARCH_DIRS" | rofi -dmenu -p "Find directory")

if [ -z "$CHOSEN_DIR" ]; then
    exit 1
fi

# $TERMINAL -e "cd $CHOSEN_DIR && yazi"
alacritty -e bash -c "yazi '$CHOSEN_DIR'; exec bash"
