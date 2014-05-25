#!/bin/bash
for d in $HOME/.*  ; do
    brek=false
    while read b ; do
        if test $d = $HOME/$b ; then
            brek=true
        fi
    done < dotfileblacklist
    if $brek ; then
        continue
    fi
    for f in $(find $d -type f ) ; do
        dotf=${f#$HOME/.}
        if ! diff -Nu "${dotf}" "${f}" ; then
            echo Above diff will be applied by cp overwrite?
            select a in yes no ; do
                if test x$a = xyes ; then
                    cp -v "$f" "$dotf"
                elif test x$a = xno ; then
                    echo Skipped
                else
                    echo Unknown $a
                fi
                break
            done
        fi
    done
done
