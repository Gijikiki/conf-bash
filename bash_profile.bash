# General Bash configuration file
#
# Adapted from the default Debian configuration.

# Skip the rest of the script if not running interactively.
case $- in
    *i*) ;;
      *) return;;
esac

### General Configuration ###
HAS_NERD=1			# Nerd fonts
BASH_CONFIG=~/.config/bash	# Location of config files

# For organization, readability, and maintenance's sake, the various Bash
# configuration options are split into different files and placed in the
# components directory.
#
# This section sourcces all files with the *.bash extension in that directory
files=( $(find "${BASH_CONFIG}/components" -maxdepth 1 -type f -name "*.bash") )
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
	source "$file"
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
