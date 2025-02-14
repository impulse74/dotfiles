#!/bin/sh

while true; do
    # Get the current date and time
    datetime=$(date +"%d. %m. %Y %H:%M:%S")

    # Get volume level and mute status
    volume_status=$(amixer get Master | grep -oP '\[.*\]' | head -n 1)
    
    if [[ "$volume_status" == *"off"* ]]; then
        volume="mute"
    else
        volume=$(amixer get Master | grep -oP '\d+%' | head -n 1)
    fi

    # Update the status bar with the info
    xsetroot -name "vol $volume | $datetime"

    # Wait for 1 second before repeating
    sleep 1
done

