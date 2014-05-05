source ${HOME}/.bash-aliases
source ${HOME}/.bash-env
if test -r /etc/profile.d/bash-completion.sh ; then
    source /etc/profile.d/bash-completion.sh
fi
case ${TERM} in
    xterm*) export TERM=xterm-256color;;
    screen*)  export TERM=screen-256color;;
    putty*) export TERM=putty-256color;;
esac
