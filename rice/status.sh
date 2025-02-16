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

    network_if=$(ip route show default | awk '{print $5}')
    if [[ -z "$network_if" ]]; then
	    network_if_status="disconnected"
    else
	    network_if_status=$(ip route show default | awk '{print $5}')
    fi

    # Update the status bar with the info
    xsetroot -name "$network_if_status | vol $volume | $datetime"

    # Wait for 1 second before repeating
    sleep 1
done

