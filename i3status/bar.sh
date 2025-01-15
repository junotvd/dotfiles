#!/bin/sh

i3status while :
do
        read line
        echo "$(exec ~/dotfiles/scripts/fetch_calendar.py)| $line" || exit 1
done
# echo -n "$(exec ~/dotfiles/scripts/fetch_calendar.py)"
