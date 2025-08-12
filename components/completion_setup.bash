# Adds bash completion if available

COMPLETION_POSIX=~/usr/share/bash-completion/completions
COMPLETION_POSIX_ETC=/etc/bash_completion

# enable bash completion in interactive shells
if ! shopt -oq posix; then
	if [ -f $COMPLETION_POSIX ]; then
		. $COMPLETION_POSIX
	elif [ -f $COMPLETION_POSIX_ETC ]; then
		. $COMPLETION_POSIX_ETC
	fi
fi
