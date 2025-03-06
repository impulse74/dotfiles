#!/bin/sh

xrandr --output HDMI-1 --mode 1920x1080 --rate 120 --primary
xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --right-of HDMI-1

picom &
dunst &
$HOME/.status.sh &
exec dwm
