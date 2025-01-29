#!/bin/bash

pulseaudio --check || pulseaudio -D
# fixing bugs https://bugs.chromium.org/p/chromium/issues/detail?id=370022
# https://github.com/google/xsecurelock/issues/24
# https://github.com/google/xsecurelock/issues/97
# xcompmgr -c &
picom --backend glx --fade-exclude 'class_g = "xsecurelock"' &
# picom --backend glx --paint-on-overlay
# handled by dex?
#nm-applet &
# pasystray & # handled by dex?
#nice skypeforlinux &
telegram-desktop &
signal-desktop --start-in-tray &
#teams &
# gnome-settings-daemon &
# unity-settings-daemon &
# xss-lock -l -- ~/.config/i3/i3lock.sh &
# xscreensaver &
# xss-lock -n /usr/libexec/xsecurelock/dimmer -l -- xsecurelock &
PATH=/usr/libexec/xsecurelock/:$PATH xidlehook --not-when-fullscreen \
    --timer 93 ̈́'/usr/libexec/xsecurelock/dimmer' ''\
    --timer 12 'xsecurelock' ''\
    --timer 900 'systemctl suspend' '' &
#env XSECURELOCK_SAVER=saver_xscreensaver xsecurelock
synclient VertScrollDelta=-72
synclient TapButton1=0
synclient TapButton2=1
synclient TapButton3=3
synclient MaxSpeed=3
synclient AccelFactor=0.110
#bash $HOME/.screenlayout/rotate-left.sh
feh --bg-max --randomize "$(xdg-user-dir PICTURES)/" &
redshift-gtk &
gxkb &
setxkbmap -layout fi,ru,no -variant ,phonetic, -option grp:shifts_toggle
# xscreensaver-suspend.bash &
# xset s 60 5
# xset dpms 100 600 1200
# maybe xidlehook does it^^
#
# just run proton mail bridge in detached screen (probs asks for gpg pass)
screen -S protonmail -dm proton-mail-bridge --cli
