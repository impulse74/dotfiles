#!/bin/sh

prev_status=""

while true; do
    # Get the current date and time
    datetime=$(date +"%d.%m.%Y %H:%M:%S")

    # Get volume level and mute status
    volume_info=$(amixer get PCM | awk -F'[][]' '/%/ {print $2; exit}')
    if amixer get PCM | grep -q '\[off\]'; then
        volume="mute"
    else
        volume="$volume_info"
    fi

    # Get network status
    network_if=$(ip route show default | awk 'NR==1 {print $5}')
    network_if=${network_if:-"disconnected"}

    # Construct status string
    status=" $network_if | vol $volume | $datetime"

    # Update only if changed
    if [ "$status" != "$prev_status" ]; then
        xsetroot -name "$status"
        prev_status="$status"
    fi

    # Wait for events instead of polling
    inotifywait -qq -e modify /proc/interrupts /sys/class/net/*/operstate /sys/class/sound/card*/pcm*/sub*/status &> /dev/null
done
