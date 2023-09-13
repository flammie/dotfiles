options.subscribe = true
--options.charset = 'UTF-8' -- MS exchange supports us-ascii...
options.create = true

-- get passwords from pass manager
-- _, passuit = pipe_from("pass uit.no")
_, passgmail = pipe_from("pass gmail")
-- _, passuhh = pipe_from("pass uni-hamburg-uhh")

-- trim whitespace... some imaps mind it, some dont'
-- _, _, passuit = string.find(passuit, '([%w%p]+)')
_, _, passgmail = string.find(passgmail, '([%w%p]+)')
-- _, _, passuhh = string.find(passuhh, '([%w%p]+)')

-- my work email account
-- uit = IMAP {
--     server = 'outlook.office365.com',
--     username = 'tpi006@uit.no',
--     password = passuit,
--     ssl = 'tls'
-- }

-- google acc
gmail = IMAP {
    server = 'imap.gmail.com',
    username = 'ffflammie@gmail.com',
    password = passgmail,
    ssl = 'tls1',
}

-- my old work email account
-- uhh = IMAP {
--     server = 'mailhost.uni-hamburg.de',
--     username = 'senv546',
--     password = passuhh,
--     ssl = 'tls'
-- }

newm = gmail['INBOX']:is_unseen()

-- UHH old block:
--
--redmines = uhh['INBOX']:contain_from('redmine@hzsk.de')
--redmines:move_messages(uhh['Redmine'])

-- otrss = uhh['INBOX']:contain_from('support@clarin-d.de')
-- otrss:move_messages(uhh['HelpdeskOTRS'])

--cldrs = uhh['INBOX']:contain_from('cldr-users@unicode.org')
--cldrs:move_messages(uhh['Lists'])
--corporas = uhh['INBOX']:contain_to('corpora@uib.no')
--corporas:move_messages(uhh['Lists'])

--clarins =
--uhh['INBOX']:contain_to('clarind-devel@mailman.sfs.uni-tuebingen.de')
--clarins:move_messages(uhh['Clarin'])

--aspekti = uhh['INBOX']:contain_to('as-pekti@helsinki.fi')
--aspekti:move_messages(uhh['Lists'])

-- acaspam = uhh['INBOX']:contain_from('updates@academia-mail.com')
-- acaspam:move_messages(uhh['ResearchSomeSpam'])
-- rgspam = uhh['INBOX']:contain_from('no-reply@researchgatemail.net')
-- rgspam:move_messages(uhh['ResearchSomeSpam'])
-- linkedinspam = uhh['INBOX']:contain_from('news@linkedin.com')
-- linkedinspam:move_messages(uhh['ResearchSomeSpam'])
-- linkedinspam = uhh['INBOX']:contain_from('notifications@linkedin.com')
-- linkedinspam:move_messages(uhh['ResearchSomeSpam'])
-- linkedinspam = uhh['INBOX']:contain_from('notifications-noreply@linkedin.com')
-- linkedinspam:move_messages(uhh['ResearchSomeSpam'])
-- linkedinspam = uhh['INBOX']:contain_from('jobs-listings@linkedin.com')
-- linkedinspam:move_messages(uhh['ResearchSomeSpam'])

--helpdesks = uhh['INBOX']:contain_from('root@mailhost.uni-hamburg.de')
--helpdesks:move_messages(uhh['HelpdeskRoot'])
--helpdesks = uhh['INBOX']:contain_to('root@mailhost.uni-hamburg.de')
--helpdesks:move_messages(uhh['HelpdeskRoot'])

--mtlists = uhh['INBOX']:contain_to('mt-list@eamt.org')
--mtlists:move_messages(uhh['Lists'])
--sigtyplists = uhh['INBOX']:contain_to('sigtyp@googlegroups.com')
--sigtyplists:move_messages(uhh['Lists'])

--acls = uhh['INBOX']:contain_from('portal@aclweb.org')
--acls:move_messages(uhh['Lists'])

--apertiums = uhh['INBOX']:contain_to('apertium-stuff@lists.sourceforge.net')
--apertiums:move_messages(uhh['Lists'])

-- Gmail block:
-- To: samicvs@gtsvn.uit.no
giellacommits = newm:contain_to("samicvs@localhost.uit.no")
giellacommits:move_messages(gmail["imapfiltered/versiondiffs"])
giellacommits = newm:contain_to("samicvs@gtsvn.uit.no")
giellacommits:move_messages(gmail["imapfiltered/versiondiffs"])
gsoc = newm:contain_to("google-summer-of-code-mentors-list@googlegroups.com")
gsoc:move_messages(gmail["imapfiltered/lists"])
tesseract = newm:contain_to("tesseract-ocr@googlegroups.com")
tesseract:move_messages(gmail["imapfiltered/lists"])
-- To: unicode@corp.unicode.org
unicodes = newm:contain_from('unicode@unicode.org')
unicodes:move_messages(gmail['imapfiltered/lists'])
unicodes = newm:contain_to('unicode@corp.unicode.org')
unicodes:move_messages(gmail['imapfiltered/lists'])

gcinag = newm:contain_from("codein-noreply@google.com")
gcinag:move_messages(gmail["imapfiltered/gci"])
gf = newm:contain_to("gf-dev@googlegroups.com")
gf:move_messages(gmail["imapfiltered/lists"])
apes = newm:contain_to("apertium-stuff@lists.sourceforge.net")
apes:move_messages(gmail["imapfiltered/lists"])

-- github stuff
githubs = newm:contain_from("notifications@github.com")
githubs:move_messages(gmail["imapfiltered/github"])

giellacommits = newm:contain_from('noreply@github.com')
giellacommits:move_messages(gmail['imapfiltered/commits'])

-- facebooks stuff
-- From: Facebook-maininnat <mentions@facebookmail.com>
-- From: Facebook <friendupdates@facebookmail.com>
facebooks = newm:contain_from('notification@facebookmail.com')
facebooks:move_messages(gmail['imapfiltered/somespam'])
facebooks = newm:contain_from('mentions@facebookmail.com')
facebooks:move_messages(gmail['imapfiltered/somespam'])
facebooks = newm:contain_from('friendupdates@facebookmail.com')
facebooks:move_messages(gmail['imapfiltered/somespam'])

-- travis
-- From: Travis CI <builds@travis-ci.com>

traviscis = newm:contain_from('builds@travis-ci.com')
traviscis:move_messages(gmail['imapfiltered/ci'])

-- Apple søppelpost
-- applepkgs = uit['Søppelpost']:contain_from('no_reply@email.apple.com')
-- applepkgs:move_messages(uit['builds'])

-- corpora
--corporas = uit['INBOX']:contain_to('corpora@uib.no')
--corporas:move_messages(uit['Lists'])
--corporas = uit['Søppelpost']:contain_to('corpora@uib.no')
--corporas:move_messages(uit['Lists'])

-- wmt tasks
-- Cc: wmt-tasks@googlegroups.com
wmts = newm:contain_to("wmt-tasks@googlegroups.com")
wmts:move_messages(gmail["imapfiltered/lists"])


-- zulip missed
-- From: Zulip missed messages <noreply@zulip.com>
--zulips = uit['INBOX']:contain_from('noreply@zulip.com')
--zulips:move_messages(uit['zulips'])

-- ps4 store
-- From: PlayStation              <Sony@email.sonyentertainmentnetwork.com>
ps4 = newm:contain_from("Sony@email.sonyentertainmentnetwork.com")
ps4:move_messages(gmail["imapfiltered/bought"])
-- From: PlayStation <reply@txn-email.playstation.com>
psn = newm:contain_from("reply@txn-email.playstation.com")
psn:move_messages(gmail["imapfiltered/bought"])

-- tino's CI
-- From: apertium-packaging@projectjj.com
apepack = newm:contain_from('apertium-packaging@projectjj.com')
apepack:move_messages(gmail['imapfiltered/ci'])

