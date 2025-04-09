#!/usr/bin/env bash


SEMESTER=$(echo -e "2\n1" | rofi -dmenu -i -p "semester" -theme $HOME/dotfiles/rofi/black-white-selector.rasi)
OPTIE=$(echo -e "hoorcolleges\noefenzittingen\nplanning\nsamenvatting" | rofi -dmenu -i -p "hoorcolleges of oefenzittingen" -theme $HOME/dotfiles/rofi/black-white-selector.rasi)

if [ -z "$SEMESTER" ] || [ -z "$OPTIE" ]; then
    exit 0
fi

case "$SEMESTER" in
    "1")
        BASE_DIR=${1:-$HOME/uni/bachelor-1/semester-1}
        ;;
    "2")
        BASE_DIR=${1:-$HOME/uni/bachelor-1/semester-2}
        ;;
esac

BASE_DIR=$(eval echo "$BASE_DIR")

if [ "$OPTIE" == "planning" ]; then
    PDF_FILE=$(find "$BASE_DIR" -type f -name "planning.pdf" -print -quit)
    if [ -n "$PDF_FILE" ]; then
        zathura "$PDF_FILE"
        exit 1
        # else
        #     rofi -e "No planning.pdf found in $BASE_DIR/"
        #     exit 1
    fi
fi


DIRS=($(find "$BASE_DIR" -maxdepth 1 -type d -not -path "$BASE_DIR" -exec basename {} \;))

if [ ${#DIRS[@]} -eq 0 ]; then
    rofi -e "No course directories found in $BASE_DIR"
    exit 0
fi

CHOSEN_DIR=$(printf "%s\n" "${DIRS[@]}" | rofi \
    -dmenu -p "" \
    -theme $HOME/dotfiles/rofi/black-white-selector.rasi)


if [ -z "$CHOSEN_DIR" ]; then
    exit 0
fi

CHOSEN_PATH="$BASE_DIR/$CHOSEN_DIR/$OPTIE"

PDF_FILE=$(find "$CHOSEN_PATH" -type f \( -name "main.pdf" -o -name "master.pdf" -o -name "planning.pdf" \) -print -quit)

if [ -n "$PDF_FILE" ]; then
    zathura "$PDF_FILE"
else
    rofi -e "Neither main.pdf nor master.pdf found in $CHOSEN_DIR/$OPTIE"
    exit 1
fi
