# General Bash configuration file
#
# Adapted from the default Debian configuration.

# Skip the rest of the script if not running interactively.
case $- in
    *i*) ;;
      *) return;;
esac

### General Configuration ###
HAS_NERD=1	# Nerd fonts

BASH_CONFIG=~/.config/bash/

files=( $(ls -1 ${BASH_CONFIG}/components | sort) )

# Source all Bash configuration files from the components directory.
for file in "${files[@]}"; do
    if [ -f "${BASH_CONFIG}/components/$file" ]; then
	source "${BASH_CONFIG}/components/$file"
    fi
done

# Set the PS1 prompt after all other configurations are sourced.
#
# This is required do to the prompt relying on functions defined in
# the components directory
if [ -f "${BASH_CONFIG}/make_prompt.bash" ]; then
    source ${BASH_CONFIG}/make_prompt.bash
fi

# Source private configurations if they exist.
if [ -f ~/.bashrc_private ]; then
    . ~/.bashrc_private
fi

