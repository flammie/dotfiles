# Kitty dotfiles

[Kitty]() is a modern terminal app that is for some reason optimisedf for some
GPU stuffs. I guess for some people this is a selling point, for my case what is
important is that it seems to render Unicode more correctly than most others and
still support many obscure terminal things. Yeah I guess it is also fast for
some things but how often is rendering speed of your terminal really a
bottleneck anyways?

It has pretty typical configuration in .config, there's no big need to muck
about with much of it, font preference is good and disabling the oddly loud bell
that resets master mixer every single time are some obvious things to put in
your `.config/kitty/kitty.conf`:

```conf
font_family Source Code Pro
enable_audio_bell no
```


