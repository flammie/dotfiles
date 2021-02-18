#!/bin/bash
if test $# -ge 1 ; then
    echo Usage: $0
    echo
    echo Convert ics piped on stdin to my google calendar
    echo removing emails so google doesn’t spam attendees
    exit 1
fi
ICS=$(mktemp --suffix=.ics)
fgrep -v ATTENDEE | fgrep -v ORGANIZER | fgrep -v mailto: > $ICS
gcalcli import $ICS --calendar='Name Of The Calendar'
rm $ICS
