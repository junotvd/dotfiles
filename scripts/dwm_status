#!/usr/bin/env bash


battery() {
    level=$(cat /sys/class/power_supply/BAT1/capacity)
    status=$(cat /sys/class/power_supply/BAT1/status)
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if ["$STATUS" = "Charging" ]; then
            printf "CHR %s%% %s" "$level"
        else
            printf "FUL %s%% %s" "$level"
        fi
    else
        printf "BAT %s%%s %s" "$level"
    fi
    printf "%s\n" "$SEP2"
}

memory_usage() {
    mem_used =$(free -m | awk /'Mem:/ {print $3}')
    mem_total =$(free -m | awk '/Mem:/ {print $2}')
    echo "$mem_used/$mem_total""MB"
}

volume() {
    wpctl get-volume @DEFAULT_SINK@ | awk '{print int($3 * 100) "%"}'
}

date_time() {
    date "+%H:%M:%S"
}

# while true; do
#     xsetroot -name "MEM $(memory_usage) | VOL $(volume) | $(date_time)"
#     sleep 5
# done
battery
memory_usage
volume
date_time
