#!/bin/bash

choice=$(echo -e "1\n2" | rofi -dmenu -i -p "semester" -theme ~/dotfiles/rofi/black-white-selector.rasi)
if [ -z "$choice" ]; then
    exit 1
fi
case "$choice" in
    "1")
        BASE_DIR=${1:-$HOME/uni/bachelor-1/semester-1}
        ;;
    "2")
        BASE_DIR=${1:-$HOME/uni/bachelor-1/semester-2}
        ;;
esac

BASE_DIR=$(eval echo "$BASE_DIR")

DIRS=($(find "$BASE_DIR" -maxdepth 1 -type d -not -path "$BASE_DIR" -exec basename {} \;))

if [ ${#DIRS[@]} -eq 0 ]; then
    rofi -e "No course directories found in $BASE_DIR"
    exit 1
fi

CHOSEN_DIR=$(printf "%s\n" "${DIRS[@]}" | rofi \
    -dmenu -p "" \
    -theme ~/dotfiles/rofi/black-white-selector.rasi)


if [ -z "$CHOSEN_DIR" ]; then
    exit 1
fi

PDF_FILE="$BASE_DIR/$CHOSEN_DIR/hoorcolleges/main.pdf"

if [ -f "$PDF_FILE" ]; then
    zathura "$PDF_FILE"
else
    rofi -e "main.pdf not found in $CHOSEN_DIR/hoorcolleges"
    exit 1
fi
