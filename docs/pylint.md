# Flammie's dotfiles for pylint

Pylint is a *linter* for *python*, it ensure that your code is stylish. For most
of it, the default options are sensible and will lead into good code, and some
are matter of taste that you can go either. There are few that will actually
recommend objectively worse code (harder to read, logic more hidden etc.) which
some programmers think is nicer but isn't. I recommend disabling by default:
`no-else-return` and `simplifiable-if-statement`, these will both recommend
cutting code in a way that is theoretically ok, but make it less readable
because it hides the true intent of the programmer behind some "clever"
knowledge of how python works.


I personally also recommend setting `check-quote-consistency` on, while it
doesn't bother me, keeping things systematic is a nice touch and better for
those who care. I have also explicitly white-listed 1-character variable names,
there's nothing wrong with those in well-known situations and tight structures.

I haven't set limits for the *too many branches / statements / bleeps and
bloops* yet, but they seem more bothersome than reasonable so I might soon.

## No else XXX considered harmful

Pylint does this really annoying thing trying to eliminate else's when previous
if block ends in something that ends loop, function, etc. While this may be good
in few cases, it's more often stupid than not, e.g.:

```python

if color == green:
    return walk
elif color == yellow:
    return run
elif color == red:
    return stop
else:
    return error

```

This is definetely the most clear and easiest to read program flow, while:

```python
if color == green:
    return walk
if color == yellow:
    return run
if color == red:
    return stop
return error
```

takes more to read in and process. The if-elif-else is a logical and complete
block here and should be held together. The people using second approach usually
insist on using empty line separators to make it clear where the block ends
instead anyways and those are already harder to understand and at more risk of
getting mangled accidentally. (In some better languages there is a match
statement for path-complete iffing neatly, with python you should always stick
with complete if coverage.)
