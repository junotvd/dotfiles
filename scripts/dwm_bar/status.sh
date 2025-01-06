#!/bin/sh

get_info() {
    datetime=$(date '+%d-%m-%Y %H:%M:%S')

    battery=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null || echo "No Battery")

    meminfo=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')

    xsetroot -name "BAT $battery% | MEM $meminfo | $datetime"
}

while true; do
    get_info
    sleep 5
done
