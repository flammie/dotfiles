#!/bin/bash
for f in * ; do
    homef=${HOME}/.${f}
    if test -d ${f} ; then
        echo Skipping directory $f
        continue
    elif test x$f = xREADME ; then
        continue
    elif test x$f = xupdate-home.sh ; then
        continue
    elif test x$f = xupdate-dotfiles.sh ; then
        continue
    elif test x$f = xdotfileblacklist ; then
        continue
    fi
    if ! diff -Nu ${homef} ${f} ; then
        echo Above diff will be applied by cp overwrite?
        select a in yes no ; do
            if test x$a = xyes ; then
                cp -v $f $homef
            elif test x$a = xno ; then
                echo Skipped
            else
                echo Unknown $a
            fi
            break
        done
    fi
done
