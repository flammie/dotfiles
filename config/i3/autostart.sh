#!/bin/bash
xss-lock -l -- ~/.config/i3/i3lock.sh &
#synclient VertScrollDelta=-112
synclient TapButton1=1
synclient TapButton2=3
synclient MaxTapMove=10
#bash $HOME/.screenlayout/rotate-left.sh
feh --bg-max --randomize $(xdg-user-dir PICTURES)/
pacmd < compressor.pacmd
redshift-gtk &
