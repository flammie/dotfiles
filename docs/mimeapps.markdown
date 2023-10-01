# mimeapps dotfiles

`mimeapps` is a dotfile read by some random applications to figure out which
software opens which filetype in a desktop environment without a desktop
environment, perhaps something to do with X desktop standard xdg or not. You
need to have it in two places: `~/.config/mimeapps.list` and
`~/.local/share/applications/mimeapps.list`. It surely overrides some global
stuff as well. In normal desktops you can use settings to control these but with
i3 you don't have sustainable solution for this. `mimeopen -D` helps usually,
these are the files it controls. The format is same as `.desktop` files a bit,
so a bit like `.ini` files or `.toml` files or such. It's
`mimetype=.desktop-file`. how you are gonna figure out the name of the desktop
file is a mystery, I just `find` them somewhere so far...
