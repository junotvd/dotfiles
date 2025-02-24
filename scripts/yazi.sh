#!/bin/bash

DIRS=$(find ~/ ~/uni/ ~/uni/bachelor-1/ ~/uni/bachelor-1/semester-1/ ~/uni/bachelor-1/semester-2/ ~/coding/ ~/Documents/ ~/repos ~/suckless/ ~/uni/bachelor-1/semester-1/calculus-1/lesmateriaal/ -mindepth 1 -maxdepth 1 -type d)

CHOSEN_DIR=$(echo "$DIRS" | rofi -dmenu -p "Find directory")

# $TERMINAL -e "cd $CHOSEN_DIR && yazi"
alacritty -e bash -c "yazi '$CHOSEN_DIR'; exec bash"
