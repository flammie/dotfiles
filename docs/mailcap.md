# Mailcap dotfiles

Mailcap is a configuration file for command line mail clients like
[mutt](mutt.html) or Usenet news clients like tin.

Some programs only use the first thing they see in the config, so it's probably
useful to have a mailcap dotfile organised in a manner, where the first mention
of mimetype is, how you'd open anything by default. I prefer text-versions so I
have stuff like this:

```
application/msword; antiword %s; copiousoutput
application/pdf; pdftotext -q -raw %s -; copiousoutput
application/rtf;     unrtf --text %s; copiousoutput
...
```

For PDFs it's sometimes quite bad, quite unreadable, or if you need to print
loads and fill forms, you may want to just pull the graphical viewer up higher
instead:

```
application/pdf; evince '%s'
```

