#!/bin/sh

# Creates a temporary image of screen, blurs it and sets it as the i3lock image.
# To unlock type in password and press enter.
# If typed incorrectly then hit escape and try again.
img=/tmp/i3lock.png

scrot $img
convert $img -scale 10% -scale 1000% $img

i3lock -u -i $img
