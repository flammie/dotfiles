# Rust dotfiles


[Rust](https://www.rust-lang.org/) is a new fancy programming language. It's
like c++ modernised with better syntax and then stuff, nothing super special but
it's used in lots of places, and since I need to use it for things these days,
and it has few problems, I've self-documented them here.

First of all, it has its own make+maven kind of replacementy thing, which is
ok-ish, with all the usual annoyances ("features") of non-distro package
management like having million installed versions bundled with every software
blah. You have to download and install 100+ packages everytime you build or run
anything.

Ok, the biggest problem is that unlike make which defaults to non-parallel, it
defaults to the commonly recommended -j `numberofcpus+1`, but since it's even
resource heavier than g++, it kills all my minilaptops. Fix it by:

```
[build]
jobs = 1
```

in your `.cargo/config`, it's not an ini file but a TOML file which I will
probably find out in the future why it isn't ini... oh well.

## log

Rust has de facto standard logging system provided by a `log` package, which by
default does nothing. And also does different things with different softwares,
because it has kind of plugin system and everyone uses slightly different
*frontend* of a kind. A common one is `env_log`, which prints nothing by
default, unless you set up an environment variable `RUST_LOG`. If you are hacker
you should probably have it in your default env as `debug`, but a least `info`
so you get most log messages, even if you aren't you'll probably want to see
`warn` so you get warnings and errors. I have `.profile-env` for my generic
profile vars:

```bash
export RUST_LOG=debug
```

