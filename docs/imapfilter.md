# Imapfilter dotfiles

Imapfilter is a script that reorganises mail folders, it's useful
supplement for mail programs where filtering is slow, has few features,
or is totally missing. I use it for [mutt](mutt.html).

Imapfilter is just some lua stuff, so "configuration" is a lua script:

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

