options.subscribe = true
--options.charset = 'UTF-8' -- MS exchange supports us-ascii...
options.create = true

-- get passwords from pass manager
_, passuit = pipe_from("pass uit.no")
_, passgmail = pipe_from("pass gmail")
_, passuhh = pipe_from("pass uni-hamburg-uhh")

-- trim whitespace... some imaps mind it, some dont'
_, _, passuit = string.find(passuit, '([%w%p]+)')
_, _, passgmail = string.find(passgmail, '([%w%p]+)')
_, _, passuhh = string.find(passuhh, '([%w%p]+)')

-- my work email account
uit = IMAP {
    server = 'outlook.office365.com',
    username = 'tpi006@uit.no',
    password = passuit,
    ssl = 'tls'
}

-- google acc
gmail = IMAP {
    server = 'imap.gmail.com',
    username = 'ffflammie@gmail.com',
    password = passgmail,
    ssl = 'tls1',
}

-- my old work email account
uhh = IMAP {
    server = 'mailhost.uni-hamburg.de',
    username = 'senv546',
    password = passuhh,
    ssl = 'tls'
}



redmines = uhh['INBOX']:contain_from('redmine@hzsk.de')
redmines:move_messages(uhh['Redmine'])

otrss = uhh['INBOX']:contain_from('support@clarin-d.de')
otrss:move_messages(uhh['HelpdeskOTRS'])

unicodes = uhh['INBOX']:contain_from('unicode@unicode.org')
unicodes:move_messages(uhh['Lists'])
cldrs = uhh['INBOX']:contain_from('cldr-users@unicode.org')
cldrs:move_messages(uhh['Lists'])
corporas = uhh['INBOX']:contain_to('corpora@uib.no')
corporas:move_messages(uhh['Lists'])

clarins = uhh['INBOX']:contain_to('clarind-devel@mailman.sfs.uni-tuebingen.de')
clarins:move_messages(uhh['Clarin'])

aspekti = uhh['INBOX']:contain_to('as-pekti@helsinki.fi')
aspekti:move_messages(uhh['Lists'])

acaspam = uhh['INBOX']:contain_from('updates@academia-mail.com')
acaspam:move_messages(uhh['ResearchSomeSpam'])
rgspam = uhh['INBOX']:contain_from('no-reply@researchgatemail.net')
rgspam:move_messages(uhh['ResearchSomeSpam'])
linkedinspam = uhh['INBOX']:contain_from('news@linkedin.com')
linkedinspam:move_messages(uhh['ResearchSomeSpam'])
linkedinspam = uhh['INBOX']:contain_from('notifications@linkedin.com')
linkedinspam:move_messages(uhh['ResearchSomeSpam'])
linkedinspam = uhh['INBOX']:contain_from('notifications-noreply@linkedin.com')
linkedinspam:move_messages(uhh['ResearchSomeSpam'])
linkedinspam = uhh['INBOX']:contain_from('jobs-listings@linkedin.com')
linkedinspam:move_messages(uhh['ResearchSomeSpam'])

helpdesks = uhh['INBOX']:contain_from('root@mailhost.uni-hamburg.de')
helpdesks:move_messages(uhh['HelpdeskRoot'])
helpdesks = uhh['INBOX']:contain_to('root@mailhost.uni-hamburg.de')
helpdesks:move_messages(uhh['HelpdeskRoot'])

mtlists = uhh['INBOX']:contain_to('mt-list@eamt.org')
mtlists:move_messages(uhh['Lists'])
sigtyplists = uhh['INBOX']:contain_to('sigtyp@googlegroups.com')
sigtyplists:move_messages(uhh['Lists'])

acls = uhh['INBOX']:contain_from('portal@aclweb.org')
acls:move_messages(uhh['Lists'])

apertiums = uhh['INBOX']:contain_to('apertium-stuff@lists.sourceforge.net')
apertiums:move_messages(uhh['Lists'])

giellacommits = gmail["INBOX"]:contain_to("samicvs@localhost.uit.no")
giellacommits:move_messages(gmail["imapfiltered/versiondiffs"])
gsoc = gmail["INBOX"]:contain_to("google-summer-of-code-mentors-list@googlegroups.com")
gsoc:move_messages(gmail["imapfiltered/lists"])
tesseract = gmail["INBOX"]:contain_to("tesseract-ocr@googlegroups.com")
tesseract:move_messages(gmail["imapfiltered/lists"])
gcinag = gmail["INBOX"]:contain_from("codein-noreply@google.com")
gcinag:move_messages(gmail["imapfiltered/gci"])
gf = gmail["INBOX"]:contain_to("gf-dev@googlegroups.com")
gf:move_messages(gmail["imapfiltered/lists"])
apes = gmail["INBOX"]:contain_to("apertium-stuff@lists.sourceforge.net")
apes:move_messages(gmail["imapfiltered/lists"])

-- github stuff
githubs = gmail["INBOX"]:contain_from("notifications@github.com")
githubs:move_messages(gmail["imapfiltered/github"])

giellacommits = uit['INBOX']:contain_from('noreply@github.com')
giellacommits:move_messages(uit['giellacommits'])

-- facebooks stuff

facebooks = uit['INBOX']:contain_from('notification@facebookmail.com')
facebooks:move_messages(uit['somespam'])
