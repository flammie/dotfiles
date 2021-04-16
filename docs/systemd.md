# Systemd dotfiles

[Systemd]() is a system daemon that handles services / stuff that runs on
background, it was pushed to linux ecosystem somewhere in 2010's I think to
replace all other initscripts. It's a rather debated thing, since it wasn't
really an improvement from simpler systems with just shell scripts to launch
stuff. Some of the beloved notorious features include not being able to shutdown
your computer if you lose or change wlan connection (because shutting down tries
to connect to localhost over net and fails when systemd screwed up dns or
something IDK).

In anyways, reason why I have systemd in dotfiles is because you can have user
services running too. I use this to have a background script checking and
notifying of battery status, since this feature does not come easily with
[i3](i3.html). It'd be nice to actually have like a udev trigger for this
warning instead of polling the battery status, but it seems eudev ignores all
udev scripts so this is the best I came up with:

In: `.config/systemd/user/battery-monitor.service`:

```
[Unit]
Description=Patterimonitori

[Service]
Type=simple
Environment=DISPLAY=:0
Environment=XAUTHORITY=%h/.Xauthority
ExecStart=/bin/bash %h/bin/battery-monitor.bash
Restart=always
RestartSec=66

[Install]
WantedBy=default.target
```

so *daemons* like this can be run by user with `systemctl --user enable
battery-monitor` etc. The battery monitor is a simple script that greps for
battery percentage and `notify-send`s user when necessary (hence the
Environment).
