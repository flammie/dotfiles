# Flammie's dotfiles for clang-format

Clang-format is 2020's de facto standard formatter for C++, and so everyone
should have an opinion. The thing is, I don't like C++ to begin with, so it is a
bit of pearls to the swine or lipstick on a pig whatever your preferred idiom
is. There's only so much you can do with forcibly formatting ugly programming
language. I haven't wanted to spend too much time on is so this is default
format for *GNU* style as envisioned by clang folk, only things I change are:

```
BreakBeforeBraces: Allman
IndentWidth: 4
SpaceBeforeParens: ControlStatements
```

Mainly to get rid of the odd formatting of curly brackets in top level functions
followed by odd half-indents throughout. Also no space between function and
round brace. Other than that, I don't care about much besides setting
`ColumnLimit: 79` or smaller, I use tiling WMs, small screens and let's be
honest, if you need more than 80 characters on a line your code is too nested or
has too long names in it.
