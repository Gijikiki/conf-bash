# Sets PS1

### Color prefixes ###
FG_PRE="\033[38;5;"
BG_PRE="\033[48;5;"

### 256 color codes ###
COLOR_DARK_GOLD="94m"
COLOR_DARK_CYAN="18m"
COLOR_DARK_GRAY="236m"
COLOR_OFF_WHITE="252m"
COLOR_BLACK="0m"
COLOR_WHITE="15m"

### Reset code ###
COLOR_RESET="\033[0m"

### Prompt Part # [F]oreground/[B]ackground ###
PP1F="${COLOR_OFF_WHITE}"
PP1B="${COLOR_DARK_CYAN}"
PP2F="${COLOR_OFF_WHITE}"
PP2B="${COLOR_DARK_GRAY}"
PP3F="${COLOR_BLACK}"
PP3B="${COLOR_DARK_GOLD}"
PP4F="${COLOR_WHITE}"
PP4B="${COLOR_BLACK}"

### Symbols ###
if [ $HAS_NERD -ne 0 ]; then
	ARROW_GLYPH=$(echo -e '\xee\x82\xb0')
	BRANCH_GLYPH=$(echo -e '\xee\x82\xa0')

	# Check operating system type using uname
	case "$(uname)" in
	    Linux) OS_GLYPH=$(echo -e '\xee\x9c\x92' );;	# Penguin
	    Darwin) OS_GLYPH=$(echo -e '\xee\x9c\x91' );;	# Apple
	    *) OS_GLYPH=$(echo '??' );;
	esac
else
	ARROW_GLYPH=""
	BRANCH_GLYPH=""
	OS_GLYPH=""
fi

# Separators for bash prompt
SEP_1_2="\001${FG_PRE}${PP1B}${BG_PRE}${PP2B}\002${ARROW_GLYPH}"
SEP_2_3="\001${FG_PRE}${PP2B}${BG_PRE}${PP3B}\002${ARROW_GLYPH}"
SEP_2_3_A="\001${COLOR_RESET}${FG_PRE}${PP2B}\002${ARROW_GLYPH}"
SEP_LAST_1="\001${COLOR_RESET}${FG_PRE}${PP3B}\002${ARROW_GLYPH}"
SEP_LAST_2="\001${COLOR_RESET}${FG_PRE}${PP1B}\002${ARROW_GLYPH}"

# Parts of the bash prompt
PART_1="${FG_PRE}${PP1F}${BG_PRE}${PP1B}"
PART_2="${SEP_1_2}${FG_PRE}${PP2F}${BG_PRE}${PP2B}"
PART_3="${SEP_2_3}${FG_PRE}${PP3F}${BG_PRE}${PP3B}"
PART_3_A="${SEP_2_3_A}"
PART_4="\001${BG_PRE}${PP1B}\002 ${SEP_LAST_2} \001${COLOR_RESET}\002"

# Build and export the PS1 prompt
export PS1="${PART_1} ${OS_GLYPH} ${PART_2} \w \$(build_git_segment '${PART_3}' '${PART_3_A}' '${SEP_LAST_1}')\n${PART_4}"
