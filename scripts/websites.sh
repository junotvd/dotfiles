#!/bin/bash


CHOICE=$(echo -e "pdf\nprint\napollo\ntoledo\ngithub" | rofi -dmenu -i -p "" -theme $HOME/dotfiles/rofi/black-white-selector.rasi)

if [ -z "$CHOICE" ]; then
    exit 0
fi

case "$CHOICE" in
    "pdf")
        xdg-open http://100.124.103.23:8080/
        ;;
    "print")
        xdg-open https://print.kuleuven.be/app?service=page/UserWebPrint
        ;;
    "apollo")
        xdg-open https://apollo.saga-pollux.ts.net/
        ;;
    "toledo")
        xdg-open https://toledo.kuleuven.be/
        ;;
    "github")
        xdg-open https://github.com/
        ;;
esac
