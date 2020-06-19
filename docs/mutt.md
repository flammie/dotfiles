# Mutt dotfiles

After being a long-time user of claws-mail, since they are
stuck to gtk+2 and no usable html viewers, I had to make the
change to mutt recently. I miss some filtering and spam
assassination still, but imapfilter with lua scripting and
mutt with blazing fast mail usage is great (claws-mail takes
10 seconds per message, mutt 10 seconds for all your mail
ever). Mutt is troublesome to configure and lacks some
features. One good thing is to use pass for passwords:

```
set imap_pass = "`pass gmail`"
set smtp_pass="`pass gmail`"
```

just works, and looks neat. Gmail requires extra hacking,
which is detailed in the mutt wiki, nothing big but just few
odd settings.

Another pita with mutt and also stuff like tin is the support
for other stuff than text/plain, which requires [mailcap
hacking](mailcap.html), but
after a bit of work works better than graphical clients.

As for imapfilter, I have a separate page for [imapfilter
configurations](imapfilter.html)

it's no replacement for claws-mail's
filtering, but it also kind of forces you to think what's efficient
in imap, and realise that most filters you need are like this:

Also if you have the unfortune of having to use microsoft exchange for work
instead of proper mail server, you need to pile on some random hacks and
options. Google is very unclear on what and most common search results won't
work, seems like less is more will work, I got stuff to work with using:

```
set folder=imaps://outlook.office365.com/
set spoolfile=+INBOX
set record=+INBOX/Sent
set postponed=+INBOX/Drafts
set timeout=15
set mail_check=90
set imap_keepalive=180
set imap_idle
unset mark_old
```

yeah INBOX/Sent and INBOX/Drafts is wrong but it kind of works well enough,
otherwise you'll have to figure out each of the localised names of the folders
(just like with gmail btw).

