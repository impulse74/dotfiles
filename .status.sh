#!/bin/sh

prev_status=""

while true; do
    # Get the current date and time
    datetime=$(date +"%d. %m. %Y %H:%M:%S")

    # Get volume level and mute status in one call
    volume_info=$(amixer get Master)
    if echo "$volume_info" | grep -q '\[off\]'; then
        volume="mute"
    else
        volume=$(echo "$volume_info" | awk -F'[][]' '/%/ {print $2; exit}')
    fi

    # Get network interface status in one call
    network_if=$(ip route show default | awk 'NR==1 {print $5}')
    network_if_status=${network_if:-"disconnected"}

    # Construct status string
    status=" $network_if_status | vol $volume | $datetime"

    # Update only if changed
    if [ "$status" != "$prev_status" ]; then
        xsetroot -name "$status"
        prev_status="$status"
    fi

    sleep 1
done

