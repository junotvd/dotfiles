#! /bin/sh

# this makes you choose wheter or not to swap ctrl and capslock key

choice=$(echo "swap\nregular\nexit" |rofi -dmenu -i -p "ctrl and caplocks keys:" -theme ~/dotfiles/rofi/black-white-selector.rasi)
case "$choice" in
    "swap")
        setxkbmap -layout us -option ctrl:swapcaps
        ;;
    "regular")
        setxkbmap -layout us -option
        ;;
    "exit")
        exit
        ;;
esac
