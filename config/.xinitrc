#! /bin/bash

# set qwerty
setxkbmap us -variant alt-intl
setxkbmap -option compose:ralt

# use i3
exec i3 --force-xinerama

