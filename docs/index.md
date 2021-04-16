# Flammie’s dotfiles

This is a quick and dirty documentation for my dotfiles. Dotfiles means
configuration files in unix-style systems. They are in your home directory
(`$HOME` or `~`) and the filename starts with a full stop, that is also called
a dot in some circles.

The dot is omitted [in the git repo](https://github.com/flammie/dotfiles/),
there's a partial script to sync home directory and dotfiles repo as well.

## Configurations per app

For the following softwares and configurations have “documentation” or a rant
or some such attached:

* [pass](pass.html) the password store for command-line
* [fontconfig](fontconfig.html) and color emoji (2019)
* [mutt](mutt.html)
* [imapfilter](imapfilter.html)
* [vim and gvim](vim.html)
* [i3](i3.html)
* [powerline](powerline.html), partially replaced with:
  * [pureline](pureline.html)
* [mailcap](mailcap.html)
* [editorconfig](editorconfig.html)
* **gnome-terminal**, which does not have dotfiles but only a sad binary blob,
  (I'd rather use any other terminal but they get discontinued or lack features:
  * [rxvt-unicode](rxvt-unicode.html), which ironically lacks unicode support
  * termite, which doesn't work without monkeypatched vte that is a PITA to keep
    up with
  * roxterm, which is discontinued
  * sakura, had some bugs and unresponsive upstream)
* [rclone](rclone.html), a command-line interface for cloud backup, like rsync
* [rust](rust.html), a programming language with bundled package management
  unhappy face
* [autostart on X](x-autostart.html) scripts to autorun on X startup and how
* [X keymaps and gxkb](xkbmap.html) for changing x keyboard layouts
* [Gcalcli](gcalcli.html) command line client for google calendar
* [systemd](systemd.html) is a notorious system daemon that actually has user
  configurations stuffs
