#! /bin/bash

xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --off

xscreensaver &

# set rapid cursor
xset r rate 200 44

# set qwerty
setxkbmap us
setxkbmap -option compose:ralt
