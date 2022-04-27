# Xkbmap and gxkb

Xkbmap is probably the simplest way to set the keyboard layouts in linux X
desktop, and the one that's sustained the longest. There are more complicated
ways like [ibus]() but they are not necessary unless you need input methods
instead of just keyboard layout change.

The xkb layout can be changed with `setxkbmap`:

```
setxkbmap fi,en,ru ,,phonetic grp:toggle_shifts
```

the syntax is annoyingly strange, but multiple layouts are separated with
commas, then the variants separated with commas, then whatever to use to change
the layout. For Russian I need phonetic variant since I cannot be bothered to
learn new layout. The default changing keys are usually like shift-ctrl or
alt-space, things that you hit accidentally way too often, I prefer double
shifts, there's nearly never a need to hit them otherwise.
The `setxkbmap` command works well in windowing system's startup, could be
`xinitrc` or such, I use `.config/i3/autostart.sh` for i3 specifically, started
by `.config/i3/config`... which for some reason does not always stick. Often you
have to chant the `setxkbmap` from command line anyways.

If you use `systemd` the `localectl` can be used to set xkbmaps as well:

```
localectl -set-x11-keymap fi,en,ru pc104 ,,phonetic
```

ocalectl wants to know the keyboard model, you can try find it in the list
but something like pc10X is probably ok. It seems that systemd's localectl at
least now (2022) writes a profoundly stupid Xorg configuration that forces all
plugged in input devices to be keyboards and reset keyboard settings (e.g.
headphones with volume button). So probably better to just delete
`/etc/X11/xorg.conf.d/00-keyboard.conf` afterwards.

- - -

If you don't use desktop environment with keyboard applet it can be cool to see
which keyboard is activated, this is exactly the only function of `gxkb`. With
[i3](i3.html) you will probably place the `setxkbmap` in the i3 config file.
With `gxkb` you can also throw it into its own config file
`.config/gxkb/gxkb.conf`, yet another format of course:

```
[xkb config]
model=pc105
layouts=fi,no,ru
variants=,,phonetic
toggle_option=grp:shifts_toggle
```

And gxkb uses some ugly ass [flags as language
codes](http://www.flagsarenotlanguages.com/blog/).
