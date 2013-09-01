source ${HOME}/.bash-aliases
source ${HOME}/.bash-env
case ${TERM} in
    xterm*) export TERM=xterm-256color;;
    screen*)  export TERM=screen-256color;;
    putty*) export TERM=putty-256color;;
esac
