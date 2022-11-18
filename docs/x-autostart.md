# Flammie's dotfiles: X autostarting

Dex is good for handling autostart even outside Gnome et al.: `dex --autostart
--environment i3`. For things that don't have `.desktop` files, you need to find
a way to execute a shell script, there is probably some `xprofile` and `xinit`
stuff, for i3 I call `autostart.sh` from just config file: `.config/i3/config`.

## For I3, etc.

I3 is not really a multimedia desktop, I execute a script called `autostart.sh`
from i3 config like so:

```
exec --no-startup-id ~/.config/i3.autostart.sh
```

If you run `dex` it's good to have it quite early, it may run some services that
are useful early like `gnome-keyring`.

```
dex --autostart --environment i3
```

Then setting up screen locker using `xidlehook` and `xsecurelock` is a good
thing for all systems:

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

If you don't run dex, or for anything that's not in dex can go here as well:
`teams`, `steam`, `skypeforlinux`, `telegram-desktop`.

## Dex autostart

Dex autostart runs `.desktop` files from some specific dirs, but often you don't
need to care since your software will just install itself to these places
without asking. For user-based changes check `~/.config/autostart/`:

```
$ ls -1 ~/.config/autostart
redshift-gtk.desktop
teams.desktop
```

This is kind of compatibility with normal desktops, I think they run these files
automatically too (without dex).

