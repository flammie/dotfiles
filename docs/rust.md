# Rust dotfiles


[Rust]() is a new fancy programming language. It's like modern c++ with better
syntax and then stuff, nothing super special but it's used in lots of places,
and since I need to use it for things these days, and it has few problems, I've
self-documented them here.

First of all, it has its make+maven kind of replacementy thing, which is ok-ish,
with all the usual annoyances ("features") of non-distro package management like
having million installed versions bundled with every software blah.

Ok, the biggest problem is that unlike make which defaults to non-parallel, it
defaults to the commonly recommended -j `numberofcpus+1`, but since it's even
resource heavier than g++, it kills all my minilaptops. Fix it by:

```
[build]
jobs = 1
```

in your `.cargo/config`, it's not an ini file but a TOML file which I will
probably find out in the future why it isn't ini... oh well.
