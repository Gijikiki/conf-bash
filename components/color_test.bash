# Useful functions for how colors appear on your terminal
# Assumes term is setup for 256 colors

function color_test() {
    local BG_LIGHT="\033[107m"	# White background
    local BG_DARK="\033[40m"	# Black background
    local FG_LIGHT="\033[37m"	# White foreground
    local FG_DARK="\033[30m"	# Black foreground
    local COLOR_RESET="\033[0m"

    echo "--- Foreground color - light background ---"
    for color in {0..255}; do
	# Color to test
	local FG="\033[38;5;${color}m"
	local BG="\033[48;5;${color}m"

	# Foreground color - with white background
	printf "${FG}${BG_LIGHT} %3s ${COLOR_RESET}" "$color"

	# Linebreak after each block of 16
	if [ $(((color - 31) % 32)) -eq 0 ]; then
	    echo ""
	fi

    done

    echo "--- Foreground color - dark background ---"
    for color in {0..255}; do
	# Color to test
	local FG="\033[38;5;${color}m"
	local BG="\033[48;5;${color}m"

	# Foreground color - with black background
	printf "${FG}${BG_DARK} %3s ${COLOR_RESET}" "$color"

	# Linebreak after each block of 16
	if [ $(((color - 31) % 32)) -eq 0 ]; then
	    echo ""
	fi

    done

    echo "--- Background color ---"
    for color in {0..255}; do
	# Color to test
	local FG="\033[38;5;${color}m"
	local BG="\033[48;5;${color}m"

	# Background color - with white text
	printf "${FG_LIGHT}${BG} %3s ${COLOR_RESET}" "$color"
	# Background color - with black text
	printf "${FG_DARK}${BG} %3s ${COLOR_RESET}" "$color"

	# Linebreak after each block of 16
	if [ $(((color - 15) % 16)) == 0 ]; then
	    echo ""
	fi
    done
}

