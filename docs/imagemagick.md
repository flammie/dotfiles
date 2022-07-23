# ImageMagick

ImageMagick is a really nice program for all image editing from command line.
The only reason it has dotfiles really is a security issue, that forced most
distros to prevent conversions to and from PDFs and postscript files, more
details of [that ghostscript security issue here](https://bugs.gentoo.org/664236)

Long story short, we can re-enable the PDFs and postscripts by adding it to
a `policy.xml` in `$XDF_CONFIG_DIR/ImageMagick/policy.xml` like so:

```xml

<?xml version="1.0" encoding="UTF-8"?>
<!-- ... -->
<policymap>
  <policy domain="coder" rights="read|write" pattern="PS" />
  <policy domain="coder" rights="read|write" pattern="PS2" />
  <policy domain="coder" rights="read|write" pattern="PS3" />
  <policy domain="coder" rights="read|write" pattern="EPS" />
  <policy domain="coder" rights="read|write" pattern="PDF" />
  <policy domain="coder" rights="read|write" pattern="XPS" />
</policymap>
```

The file has a lot of extra nonsense because it's XML and stuff, a rather
unfortunate choice of fileformat for configurations but what can you do...
