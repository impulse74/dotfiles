#!/bin/sh

if [ "$(hostname)" == "desktop" ]; then
    xrandr --output DP-0 --mode 1920x1080 --rate 180 --primary
    xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --right-of DP-0
    xset s off # disable screen saver
    xset -dpms # disable display power management signaling
fi

#xrandr --output LVDS --off
#xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --primary

xwallpaper --zoom $HOME/.wallpaper
lxpolkit &
picom &
dunst &

while :; do
    statusbar.sh
    sleep 1
done &

while :; do
    dwm > ~/.dwm.log 2>&1
done

