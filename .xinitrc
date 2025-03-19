#!/bin/sh

xrandr --output HDMI-0 --mode 1920x1080 --rate 120 --primary
xrandr --output HDMI-1 --mode 1920x1080 --rate 60 --right-of HDMI-0
xset s off # disable screen saver
xset -dpms # disable display power management signaling

xwallpaper --zoom $HOME/.wallpaper
lxpolkit &
picom &
dunst &

while :; do
    statusbar
    sleep 1
done &

while :; do
    dwm > ~/.dwm.log 2>&1
done

