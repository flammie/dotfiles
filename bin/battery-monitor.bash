#!/bin/bash

export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus"

battery_level=$(acpi -b | cut -d ' ' -f 4 | grep -o '[0-9]*')
battery_state=$(acpi | grep 'Battery' | sed 's/Battery\s[0-9]*: //' | sed 's/, [0-9][0-9]*\%.*//')
#battery_remaining=$(acpi | grep -oh '[0-9:]* remaining' | sed 's/:\w\w remaining$/ Minutes/'  | sed 's/00://' | sed 's/:/h /')

if test "$battery_state" = "Discharging" ; then
    if test "$battery_level" -le 5 -a ! -e warned-2 ; then
        notify-send '⚡⚡⚡ Virta loppu!' 'Sammutetaan ihan just...' \
            -u critical
        touch warned-2
    elif test "$battery_level" -le 10 -a ! -e warned-1 ; then
        notify-send '⚠⚡Virta loppuu!' '🗲🔋🔌Patteri alkaa olla lopussa!' \
            -u normal
        touch warned-1
    fi
else
    if test -e warned-1 ; then
        rm warned-1
    fi
    if test -e warned-2 ; then
        rm warned-2
    fi
fi
