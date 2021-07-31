#!/bin/sh

urxvtd -o -q -f
xrdb -merge ~/.config/X11/.Xresources

./.config/X11/dual-1080-monitor.sh &

exec i3
