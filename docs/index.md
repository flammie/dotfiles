---
layout: default
title: Flammie’s dotfiles documentations
---

# Flammie’s dotfiles

This is a quick and dirty documentation for my dotfiles. Dotfiles means
configuration files in unix-style systems. They are in your home directory
(`$HOME` or `~`) and the filename starts with a full stop, that is also called
a dot in some circles. The dot is omitted in the git repo, there's a partial
script to sync home directory and dotfiles repo. The below is documentation-ish
rant blog thing, written in order of newest post first.

## I3

[I3]() is the windowing manager I use, it's tiling (occupies whole screen), so
unusable for average windows / mac user. It has lot of nice configurable
shortcuts, the main idea here seems to be that we've taken over the Mod4 key
that is in contemporary keyborads marked by a [broken window
sign](https://www.google.de/search?q=windows+logo) on the keycap. The default
config is mostly good, few changes I've made:

```
# Font
font pango:Terminus 10
```

The default font is some ugly monospace, I use terminus everywhere.

```
# named workspaces
bindsym $mod+1 workspace 1: 🌐
bindsym $mod+2 workspace 2: ✉
bindsym $mod+3 workspace 3: 🗪
bindsym $mod+4 workspace 4: 🖖
bindsym $mod+5 workspace 5: ✎
bindsym $mod+6 workspace 6: 🐀
bindsym $mod+7 workspace 7: 🗁
bindsym $mod+8 workspace 8: 🎵
bindsym $mod+9 workspace 9: ⚙
bindsym $mod+0 workspace 10: 📃
bindsym $mod+Shift+1 move container to workspace 1: 🌐
bindsym $mod+Shift+2 move container to workspace 2: ✉
bindsym $mod+Shift+3 move container to workspace 3: 🗪
bindsym $mod+Shift+4 move container to workspace 4: 🖖
bindsym $mod+Shift+5 move container to workspace 5: ✎
bindsym $mod+Shift+6 move container to workspace 6: 🐀
bindsym $mod+Shift+7 move container to workspace 7: 🗁
bindsym $mod+Shift+8 move container to workspace 8: 🎵
bindsym $mod+Shift+9 move container to workspace 9: ⚙
bindsym $mod+Shift+0 move container to workspace 10: 📃
```

By default the workspaces I think are only numbered, I've added nice symbols
that hint how I organise the workspaces, it's possible to use names as well but
these take up a lot of space in the switcher.

```
# multimedia keys
bindsym XF86MonBrightnessUp exec xbacklight -inc 7
bindsym XF86MonBrightnessDown exec xbacklight -dec 7
bindsym XF86AudioMute exec amixer -D pulse sset Master toggle -q
bindsym XF86AudioLowerVolume exec amixer -D pulse sset Master 1%- unmute -q
bindsym XF86AudioRaiseVolume exec amixer -D pulse sset Master 1%+ unmute -q
```

So the weird extra keys in some semi-old laptops can be made useful too, I'm
pretty sure they are gone in modern laptops and keyboards again so this won't be
of any interest.

```
# Alt-Tab for multi-screen setups
bindsym Mod1+Tab exec i3-cycle right
bindsym Mod1+Shift+Tab exec i3-cycle left
```

I3 has a bug whe it involves multi-screen alt-tabbing and only way to fix it is
to invoke sloooooow python script

```
# passmenu
bindsym $mod+p exec passmenu
```

I use pass to store my password and it uses dmenu just like i3 so it goes
perfectly to bind it to key combo as well.

```
# keyboard changer (buggy)
bindsym $mod+y exec "setxkbmap -layout ru -variant phonetic"
bindsym $mod+Shift+y exec "setxkbmap -layout fi"
```

Since there's no satisfactory keyboard switcher applet that would last for more
than 2 years in the linux world, we have another key binding for i3 to change
the keyboard layout (because also the X version of shift-tab doesn't always
work).

```
# quick pause all noise
bindsym $mod+Shift+p exec "clementine --play-pause"
```

Finally, a boss key for all your open office needs.

## Powerline

Powerline is a set if python stuff to create modelines for vim, PS1 for bash and
so forth. I'm not really excited that it's made in python (overkill) and it
lacks some very basic features (cannot print $ or # out of the box). But it's
trendy at the moment and it's colorful and writing colour codes by hand is a
pita. So I've spent way way too much time hacking it's over-engineered json
configs that can be found in my dotfile folder
[.config/powerline](https://github.com/flammie/dotfiles/tree/master/config/powerline).

My PS1 prior to this was like `user@host cwd (historynum) [time] \n $-or#`,
where historynum is the number of last command in bash history for `!num`
shortcuts. Half of these do not exist in powerline :-(
And to get multiline working in powerline you need this arghle barghle of
nonsense json:

```
{
	"segments": {
        "above": [
            {
               "left": [
                ],
                "right": [
                ]
            }
        ],
        "left": [
        ],
        "right": [
            }
        ]
	}
}
```

did I mention, if the some of the blocks end up empty they disappear. And since
my bottom row is only $-or-#, which is not supported by powerline, it took me an
hour before I gave up and just added env `LC_ALL` there, pfft.

And finally I fixed this by writing [my own
powerline-segment](//github.com/flammie/powerline-flammie/).
