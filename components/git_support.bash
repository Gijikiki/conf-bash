# Bash functions for handling git repos

# Get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		if [ $HAS_NERD -ne 0 ]; then
			if [ -z "${STAT}" ]; then
				echo "${BRANCH_GLYPH} ${BRANCH}"
			else
				echo "${BRANCH_GLYPH} ${BRANCH} ${STAT}"
			fi
		else
			if [ -z "${STAT}" ]; then
				echo "[${BRANCH}${STAT}]"
			else
				echo "[${BRANCH}]"
			fi
		fi
	else
		echo ""
	fi
}


# Get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
	    bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
	    bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
	    bits="+${bits} "
	fi
	if [ "${untracked}" == "0" ]; then
	    bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
	    bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
	    bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
	    echo "${bits}"
	else
	    echo ""
	fi
}

# Build the git segment of the bash prompt
function build_git_segment() {
	local GIT_MSG="$(parse_git_branch)"
	if [ ! "${GIT_MSG}" == "" ]; then
		printf "%s" "$1"
		printf " %s " "$(parse_git_branch)"
		printf "%s" "$3"
	else
		printf "%s" "$2"
	fi
}
