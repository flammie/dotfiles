# Flammie's dotfiles for dunst

[Dunst]() is a lightweight implementation for desktop notifications, i.e. tiny
windows that pop up from your messaging apps, browser and music player for
example. Most linuxes will probably have gnomes notification daemon by default,
that's bit more multimedia and heavier, probably not that much of a difference
these days, the main difference is that dunst looks neater on [i3](i3.html),
it's less invasive and more configurable than gnome notification daemon. One big
plus with dunst is that it shows notifications for few seconds only and then
they go away for good, whereas gnome notification daemon sometimes stays there
until you click it to open something and get sidetracked, and it also saves all
unclicked notifications to show big red numbers of undone things demanding your
attention in notification area, this is one of the most *toxic design choices*
of early 2000's so avoiding it by default is a huge plus.

The dunst configuration has tons of stuff to tweak, so far I haven't done much.
For some reason the default settings for me on i3 create a full screen vertical
bar that could be cool, but I have chosen to prefer to imitate traditional
notification styles with floating tiny box on top right with well-recognisable
unreadable X style geometry option `300x5-30+20`. Always good to set fonts too
and a little tweak to message format:

```ini
[global]
    geometry = "300x5-30+20"
    font = Source Code Pro 12
    format = "<i>%a</i>: <b>%s</b> %p\n%b"
```


