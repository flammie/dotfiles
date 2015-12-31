#!/bin/bash
xautolock -detectsleep -locker $HOME/.i3/i3lock-suspend.sh &
synclient VertScrollDelta=-112
synclient TapButton1=1
synclient TapButton2=3
feh --bg-max --randomize $(xdg-user-dir PICTURES)/
