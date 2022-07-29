# Flammie's dotfiles: X autostarting

Dex is good for handling autostart even outside Gnome et al.: `dex --autostart
--environment i3`.

## For I3

I3 is not really a multimedia desktop, I execute a script called `autostart.sh`
from i3 config like so:

```
exec --no-startup-id ~/.config/i3.autostart.sh
```

This will execute the screen locker using `xidlehook` and `xsecurelock`:

```
xidlehook --not-when-fullscreen --not-when-audio \
    --timer 60 ̈́'/usr/libexec/xsecurelock/dimmer' ''\
    --timer 10 'xsecurelock' ''\
    --timer 900 'systemctl suspend' '' &
```

On laptops you need to "autostart" synaptics touchpad settings:

```
synclient VertScrollDelta=-72
synclient TapButton1=0
synclient TapButton2=1
synclient TapButton3=3
```

invert vertical scroll and disable single finger tapping cause it causes so many
false clicks and drags (the tap-drag gesture on linux is dreadfully bad);
two fingers for left click and three fingers for middle click is the way to go.

```
exec --no-startup-id $HOME/.screenlayout/rotate-left.sh
```

An ARandR-script fixing monitor layout for dual screen setups or fixing
resolution for HTPC is in order.

Feh can show pictures from the picture folder as background for desktop, you
don't see it often in i3 but usually when you see it it should be pretty
pictures (e.g. when switching to a projector in front of a class):

```
feh --bg-max --randomize $(xdg-user-dir PICTURES)/
```

Definitely always run [redshift]() on every system you use to sleep better:

```
redshift-gtk &
```

If you don't run dex or anything that's not in dex can go here as well: `teams`,
`steam`, `skypeforlinux`, `telegram-desktop`...
