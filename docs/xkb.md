# Xkb and mapping single keys

*There's another document on xkbmap for selecting whole keyboard layouts,
which also seems to work on both Xorg and wayland even if it's xkb stuff, this
one is about changing single key mappings.*

So I am currently in a situation where my backspace key has stopped working, my
solution is to repurpose the delete key for that, since I rarely use the actual
delete functionality of it. (Note to self, while debugging this, Ctrl-H always
acts as backspace, since it can be very hard navigating the shell and editors
without backspace).
I tried googling a lot of way to make this work but
most require installing an unmaintained app out of packaging system atm, here's
an xkb hack I found out that work. Mainly just flat out editing the xkb key map
data by hand. This data is located in `/usr/share/X11/xkb/`, and since I want it
to work on all layouts I switch to, I edited file
`/usr/share/X11/xkb/symbols/pc`:

```
    key <DELE> {[  BackSpace, Delete  ]};
```

Originally this reads just `Delete`. Bad side of editing `/usr/share/` is that
it gets wiped on update. Some posts suggest that putting this into
`.config/xkb/.../xyz` would work, I tried that but did not get it working.
