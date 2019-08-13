# Powerline dotfiles

Powerline is a set if python stuff to create modelines for vim, PS1 for bash
and so forth. I'm not really excited that it's made in python (overkill) and it
lacks some very basic features (cannot print $ or # out of the box). But it's
trendy at the moment and it's colorful and writing colour codes by hand is a
pita. So I've spent way way too much time hacking it's over-engineered json
configs that can be found in my dotfile folder
[.config/powerline](https://github.com/flammie/dotfiles/tree/master/config/powerline).

My PS1 prior to this was like `user@host cwd (historynum) [time] \n $-or#`,
where historynum is the number of last command in bash history for `!num`
shortcuts. Half of these do not exist in powerline :-( And to get multiline
working in powerline you need this arghle barghle of nonsense json:

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

I am looking to replace powerline by something a bit more elegant and
well-designed in the future...
