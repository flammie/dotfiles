# ~/.bashrc: executed by bash(1) for non-login shells.

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ] ; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

case ${TERM} in
    xterm*) export TERM=xterm-256color;;
    screen*)  export TERM=screen-256color;;
    putty*) export TERM=putty-256color;;
esac

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


source ${HOME}/.bash-aliases
source ${HOME}/.bash-env

# WSL stuffs
if grep -F -q WSL2 /proc/version ; then
    #LIBGL_ALWAYS_INDIRECT=1
    #DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0
    XKBLAYOUT=fi
fi


# add SSH info to PS1 or "localhost"
if test -n "$SSH_CONNECTION" ; then
    SHOWHOST=$(echo $SSH_CONNECTION | cut -d ' ' -f 1 | sed -e 's/...$/.../')
else
    SHOWHOST=localhost
fi
sep=$'\u276F'
export PS1="${PS1/\\h/\\[\\033[01;37m\\]${SHOWHOST}${sep}\\[\\033[01;33m\\]\\h}"
source ~/github/flammie/pureline/pureline ~/.pureline.conf
eval $(thefuck --alias)
complete -cf doas


