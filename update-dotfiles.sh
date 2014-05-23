#!/bin/bash
for f in $HOME/.* ; do
    dotf=${f#$HOME/.}
    if test -d ${f} ; then
        echo Skipping directory $f
        continue
    fi
    if ! diff -Nu ${dotf} ${f} ; then
        echo Above diff will be applied by cp overwrite?
        select a in yes no ; do
            if test x$a = xyes ; then
                cp -v $f $dotf
            elif test x$a = xno ; then
                echo Skipped
            else
                echo Unknown $a
            fi
            break
        done
    fi
done
