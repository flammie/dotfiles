# Imapfilter dotfiles

Imapfilter is a script that reorganises mail folders, it's useful
supplement for mail programs where filtering is slow, has few features,
or is totally missing. I use it for [mutt](mutt.html).

Imapfilter is just some lua stuff, so "configuration" is a lua script:

```lua
githubs = gmail["INBOX"]:contain_from("notifications@github.com")
githubs:move_messages(gmail["imapfiltered/github"])
```

## Proton (bridge)

Proton provides imap only via a proton bridge app that used to be proper open
source but now is a bit questionable, they deleted history and issues from
github too. It's a bit painful to get to work with everything, [after several
years of debugging](https://github.com/lefcha/imapfilter/issues/297) I have
reached a working configuration:

```lua
options.starttls = true
options.certificates = false
options.hostnames = false

-- ....

proton = IMAP {
    server = 'localhost',
    username = ...@proton.me',
    password = passproton,
    -- ssl = 'auto',
    port = 1143,
}
```

To move a message to a folder in proton you have to move it into `Folders/blah`
instead of `blah`, proton will refuse to move or create folders in root.

## Gmail

Gmail is really weird with folders and moves and creates so
you have to test and try a lot. This helped me:

```lua
options.subscribe = true
-- options.charset = 'UTF-8'
options.create = true
```

and use verbose mode a lot to debug.

## Pass

Imapfilter works with pass like anything, so no need to include passwords
plaintext in your configs and you can use any good password manager that can
pipe. One thing I noticed debugging this is that some email servers are more
lenient than others with whitespace in the password (and/or lua screws it up
here), so you need something like this:

```
_, pass = pipe_from("pass mail")
_, _, passmail = string.find(passmail, '([%w%p]+)')
```

the example is from the [imapfilter docs
here](https://github.com/lefcha/imapfilter/blob/master/samples/extend.lua).

