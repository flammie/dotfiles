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

## Mutt and imapfilter

After being a long-time user of claws-mail, since they are
stuck to gtk+2 and no usable html viewers, I had to make the
change to mutt recently. I miss some filtering and spam
assassination still, but imapfilter with lua scripting and
mutt with blazing fast mail usage is great (claws-mail takes
10 seconds per message, mutt 10 seconds for all your mail
ever). Mutt is troublesome to configure and lacks some
features. One good thing is to use pass for passwords:

set imap_pass = "`pass gmail`"
set smtp_pass="`pass gmail`"
```

just works, and looks neat. Gmail requires extra hacking,
which is detailed in the mutt wiki, nothing big but just few
odd settings.

Another pita with mutt and also stuff like tin is the support
for other stuff than text/plain, which requires mailcap hacking, but
after a bit of work works better than graphical clients.
So it's probably useful to have a mailcap dotfile where
first mention of mimetype is how you'd open anything, I
prefer text-versions so I have stuff like this:

```
application/msword; antiword %s; copiousoutput
application/pdf; pdftotext -q -raw %s -; copiousoutput
application/rtf;     unrtf --text %s; copiousoutput
...
```

For PDFs it's sometimes bad if you want to print lots you
may want to just pull the graphical viewer up higher:

```
application/pdf; evince '%s'
```

As for imapfilter, it's no replacement for claws-mail's 
filtering, but it also kind of forces you to think what's efficient
in imap, and realise that most filters you need are like this:

```lua
githubs = gmail["INBOX"]:contain_from("notifications@github.com")
githubs:move_messages(gmail["imapfiltered/github"])
```

Gmail is really weird with folders and moves and creates so
you have to test and try a lot. This helped me:

```lua
options.subscribe = true
options.charset = 'UTF-8'
options.create = true
```

and use verbose mode a lot.

## Vim and gvim

Vim is my editor of choice, and it has loads of customisations
and configurations. Most important trick for me has been
finding Vundle as *plugin* manager. Since there are a dozen of
different ones out there, I've tried also pathogen but it wasn't really
working for me, Vundle just works with [one-time setup]()
and then just `:PluginUpdate` when you feel like it. Other
nice components are things like editorconfig and powerline, basically
most of the complex config stuff outsourced. 

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
