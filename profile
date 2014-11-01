# agents are needed for shell and x sessions all
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi
GPGAGENT=/usr/bin/gpg-agent
GPGAGENTARS="--daemon"
if [ -z "$GPG_AGENT_INFO" -a -x "$GPGAGENT" ] ; then
    eval "$GPGAGENT $GPGAGENTARGS"
fi
# this is common env for all sessions
. .profile-env
