# rclone dotfiles


[rclone](//rclone.org) is a command-line interface to cloud backup services I
use. It supports e.g. [Dropbox](//dropbox.com) and works on raspberry pi and
doesn't require bundled python blobs like dropbox's original gui. It doens't
really have much in terms of shareable dotfiles, but the dir names are saved in
config alongside auth tokens:

```
[Dropbox]
type = dropbox
token = <redacted auth stuff>
```

Did I mention it's modelled after rsync? Quite easy to start using.
