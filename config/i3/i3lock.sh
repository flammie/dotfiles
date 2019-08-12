#!/bin/bash
import -depth 8 -window root /tmp/i3locked.png
mogrify -scale 10% -scale 1000% -gravity center -fill  red -pointsize 128 -annotate 50%x50%-320 LOCKED! /tmp/i3locked.png
i3lock -n -i /tmp/i3locked.png
