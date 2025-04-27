#!/bin/bash

pulseaudio --check || pulseaudio -D
telegram-desktop &
signal-desktop --start-in-tray &
# gnome-settings-daemon &
# unity-settings-daemon &
gammastep-indicator &
# just run proton mail bridge in detached screen (probs asks for gpg pass)
screen -S protonmail -dm proton-mail-bridge --cli
