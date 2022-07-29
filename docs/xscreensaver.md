# Flammie’s dotfiles: Xscreensaver

[Xscreensaver](https://jwz.org/xscreensaver) is the classical screen saver for
linux and X. It has some configuration files (actually uses the `xrdb` stuff),
but mainly it is easiest to configure via the graphical program
`xscreensaver-demo` or `xscreensaver-settings`. If you use desktop environments,
chances are there is a fork of xscreensaver included; it's usually worse than
actual xscreensaver and should be deleted.

More importantly, xscreensaver needs be launched automatically on startup, with
i3 a good place for this is i3's config in `.config/i3/config`. The default
configuration for i3 uses `i3-lock` probably, this can be replaced with just a
call to `xscreensaver &` for basic operation. However this seems to be missing
some powersaving features, perhaps a better way is to use screen lockers, I
haven't found a perfect combo yet, but `xidlehook` with `xsecurelock` seems most
promising so far (`xss-lock` is ok but gets confused by chromium too often and
inhibited):

```
xidlehook --not-when-fullscreen --not-when-audio \
    --timer 60 ̈́'/usr/libexec/xsecurelock/dimmer' ''\
    --timer 10 'xsecurelock' ''\
    --timer 900 'systemctl suspend' '' &
```

This can be thrown in e.g. i3's config or relevant autostart. Xsecurelock calls
xscreensaver until suspend then, based on
`$XSECURELOCK_SAVER=saver_xscreensaver`. In this configuration xset is not
needed but it can be there for extra blanking and saving why not.
The configuration of locking times with xset seems to be affected by both
xscreensaver configuration and `xset` settings. Quite unintuitively, the default
settings do not work, I have gotten the following to work:

```
xset s 60 5
xset dpms 300 600 1200
```

This seemingly means start locker in 60 seconds, finish  the dimmer script in 5
seconds(?) then turn off screen in 300, 600 and 1200 seconds (different states
but I wonder if they have any meaning in 2020's flat screens).
