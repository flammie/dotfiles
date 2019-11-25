# Rxvt Unicode or URxvt dotfiles

[Rxvt-unicode]() is a quite minimal terminal emulator, it promises to be a
unicode version of even more minimal terminal emulator, however, at its current
state (2019) it is not fully usable for a whole lot of unicode support. I have
documented here few hacks to make it semi-usable before giving up.

First of all, rxvt just use X resource database for settings, which is all
right, because it can be configured via text files, unlike gnome stuff for
example. These stuff is saved in either `.Xdefaults` or `.Xresources`, there's
probably some difference in these files, but I'm not sure what it is.

So, first thing that I often do with terminal emulators is to get the default
colours fixed, at least swap to light on dark instead the eye burning defaults
like black on white. Here's my slightly tweaked solarised:

```
! Default stuff to white on blck
*background: black
*foreground: white
*cursor: pink

! Solarized?
*background: #002b36
*foreground: #839496
*fading: 40
*fadecolor: #002b36
*pointerColorBackground: #586e75
*pointerColorForeground: #93a1a1
*color0: #275662
*color1: #dc322f
*color2: #859900
*color3: #b58900
*color4: #268bd2
*color5: #d33682
*color6: #2aa198
*color7: #eee8d5
*color9: #cb4b16
*color8: #204b56
*color10: #586e75
*color11: #657b83
*color12: #839496
*color13: #6c71c4
*color14: #93a1a1
*color15: #fdf6e3
```

The syntax \*... here goes for all apps, so basically all terminal apps that use
settings for colors0 through 15, will pick these up, even more interestingly,
all raw X apps (non GTK, non QT...), will use the very generic settings like
\*background and \*foreground... of course there are probably less than handful
raw X apps like that in existence anyways, but anyway.

It is possible to prefix these settings to the specific app, and I've used this
syntax for the more urxvt-specific stuff:

```
URxvt.font: xft:Source Code Pro:size=10:minspace=False,\
            xft:Terminus:size=10:minspace=False,\
            xft:Noto Mono:size=10:minspace=False,\
            xft:Unifont:size=10:minspace=False
!URxvt.letterSpace: 2
```

First step for unicode support is to set fonts. Urxvt doesn't use the advanced
font stuffs somehow to find the right fonts for missing characters so you have
to shuffle them around manually all the time. The second setting letterSpace is
also needed to see unicode characterrs properly, some show up with various
vvalues between 0 and 3 I think, but also settings make everything else ugly. So
there's no good solution for seeing all characters of all unicode blocks for
"rxvt-unicode", furthermore, I think the author sees the problem is with
font-makers or unicode or something so this not something that will be fixed in
the near future.


Here's the rest of specific config hacks I did:
```
URxvt.print-pipe: cat >/tmp/urxvt-printscreen
URxvt.saveLines: 8192
URxvt.perl-ext-common: default,matcher
URxvt.url-launcher: /usr/bin/xdg-open
URxvt.matcher.button: 2
URxvt.matcher.rend.0: Uline Bold fg5
```

Nothing special, just redirecting PrintSc key from lpr to screenshotting, more
lines in schrollback buffer, clicky pretty URLs and that's all.

