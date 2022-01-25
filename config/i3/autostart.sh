#!/bin/bash
nm-applet &
pasystray &
nice skypeforlinux &
telegram-desktop &
teams &
# gnome-settings-daemon &
# unity-settings-daemon &
# xss-lock -l -- ~/.config/i3/i3lock.sh &
xscreensaver &
synclient VertScrollDelta=-72
synclient TapButton1=0
synclient TapButton2=1
synclient TapButton3=3
synclient MaxSpeed=3
synclient AccelFactor=0.110
#bash $HOME/.screenlayout/rotate-left.sh
feh --bg-max --randomize "$(xdg-user-dir PICTURES)/"
redshift-gtk &
setxkbmap -layout fi,ru,no -variant ,phonetic, -option grp:shifts_toggle
gxkb &
