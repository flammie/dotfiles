# Gcalcli

[Gcalcli]() is a command-line interface to google calendar. Useful to get
calendar attachments from mutt to google calendar. It's quite hacky, requires
the usual google setup dance with api keys and developer console and all that.
Also you need to force renew the oauth tokens by manually deleting it every once
in a while. I have attached a bash script so you can pipe the attachment from
mutt to google calendar directly, but the script is very bad with handling
different calendars so you have to fill in the calendar name there. The default
calendar setting in configuration file does not seem to work at all.

```bash
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
```

Yeah, if you leave the email addresses in the ics file, google calendar will
send spam to your colleagues, so I grep them out... but if your colleagues use
calendar invites in ics format, the chances are they are using some graphical
email program that doesn't even show them this spam, I think microsoft exchange
stuff for example do not.
