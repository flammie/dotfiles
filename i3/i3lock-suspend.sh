#!/bin/bash
scrot /tmp/i3locked.png
mogrify -scale 10% -scale 1000% /tmp/i3locked.png
i3lock -i /tmp/i3locked.png
sleep 300
$HOME/.i3/i3-sensible-suspend
