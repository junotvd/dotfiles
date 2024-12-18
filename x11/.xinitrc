#! /bin/sh

xrdb ~/.Xresources

#~/dotfiles/scripts/dwm_bar/status.sh &
pipewire &
pipewire-pulse &

exec dwm
