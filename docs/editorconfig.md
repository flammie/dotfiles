# Editorconfig dotfiles

Editorconfig is a generic configuration file to make different editors to format
files of the same syntax in systematic manner. It works with multiple editors
and knows the basic things, like keeping line lengths in order and tabs vs.
spaces. These are my preferences and I usually prefer to get code contributions
in my projects to follow these guidelines, though anything systematic is okay by
me, and that is exactly what editorconfig does, keeps the basic formatting
systematic.

```
[*]
end_of_line = lf
insert_final_newline = true
charset = utf-8
```

This should be no surprises, UTF-8 everywhere, unix linefeeds, final newlines,
these are basics that work with pretty much every text-based file formats
hopefully.

```
[*.{c,cc,cpp,h,hh,java,py,bash,sh,tex,md,markdown}]
max_line_length = 80
trim_trailing_whitespace = true
```

I do not like to read source code if line-length is much longer than 80
characters per line, I edit code in variety of devices including minilaptop that
is less than 80 characters wide for full-screen windows. 80 characters per line
is also about ideal for human eyes and brains to work with.

```
[*.{xml,pom,dix,t1x,t2x,t3x,lrx,rlx,html}]
indent_size = 2
trim_trailing_whitespace = true
```

In XML based formats the trees are always deep and so indents larger than 2 will
soon be unreadable. In XML I do not enforce the 80 characters per line since it
gets quite impossible for many useful formats like so.
