#! /bin/sh

# this makes you choose wheter or not to swap ctrl and capslock key

choice=$(echo "swap\nregular\nexit" |dmenu -i -p "ctrl and caplocks keys:")
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
