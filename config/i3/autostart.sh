#!/bin/bash
xss-lock -l -- ~/.config/i3/i3lock.sh &
synclient VertScrollDelta=-72
synclient TapButton1=0
synclient TapButton2=1
synclient TapButton3=3
#bash $HOME/.screenlayout/rotate-left.sh
feh --bg-max --randomize $(xdg-user-dir PICTURES)/
pacmd < compressor.pacmd
redshift-gtk &
