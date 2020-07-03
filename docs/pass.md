# Pass–the commandline password manager

[Pass](https://www.passwordstore.org/) is a password manager like keepass but
for us command-line users. It's a really simple program but really important for
distributing your dotfiles without revealing your passwords, programs like
[mutt](mutt.html) or [imapfilter](imapfilter.html) would normally have plaintext
passwords in them making sharing and roaming dotfiles profile a pita. With pass
you can mostly overcome that. On top of that it works for the original purpose
of password saving and generation, so you don't need to rely on Google chrome
passwords.google.com and your passwords are safe.

If you use [i3](i3.html) or dmenu, make sure to bind pass-dmenu to something
like Mod+p.

Few things to hack when using pass in config files:


imapfilter:

```lua
_, pass = pipe_from("pass mail")
_, _, passmail = string.find(passmail, '([%w%p]+)')
```

mutt:

```
set imap_pass = "`pass gmail`"
set smtp_pass="`pass gmail`"
```

Many config formats support this mutt style of calling.
