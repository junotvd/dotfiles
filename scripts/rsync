#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$0")"
source "$SCRIPT_DIR/dirs.sh"

SEARCH_DIRS=$(find "${DIRS[@]}" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sed "s|$HOME|~|")
CHOSEN_DIR=$(echo "$SEARCH_DIRS" | rofi -dmenu -p "Find directory")
CHOSEN_DIR=$(eval echo "$CHOSEN_DIR")

if [ -z "$CHOSEN_DIR" ]; then
    exit 1
fi

PASSWORD=$(rofi -dmenu -password -p "SSH Password")

if [ -z "$PASSWORD" ]; then
    (rofi -e "No password entered." & sleep 1; kill $!)
    exit 1
fi

STATUS_FILE="/tmp/rsync_status.log"
echo "Starting rsync..." > "$STATUS_FILE"

(
    sshpass -p "$PASSWORD" rsync -avP "$CHOSEN_DIR" junot@100.111.228.24:/volume1/data/junot 2>&1 | 
    while read -r line; do
        echo "$line" > "$STATUS_FILE"
        sleep 1
    done
    echo "Rsynced $CHOSEN_DIR!" > "$STATUS_FILE"
    
    sleep 10
    echo "" > "$STATUS_FILE"
) &

(rofi -e "Rsync started." & sleep 1; kill $!)
