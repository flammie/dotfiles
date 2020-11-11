# Flammie's dotfiles: X autostarting

## For I3

I3 is not really a multimedia desktop, I execute a script called `autostart.sh`
from i3 config like so:

```
exec --no-startup-id ~/.config/i3.autostart.sh
```

This will execute the screen locker using `xss-lock` and `i3-lock`:

```
xss-lock -l -- ~/.config/i3/i3lock.sh &
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
