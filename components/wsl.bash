# For WSL2 on Windows

# This prepares the windows clipboard to work properly with neovim
#
# Note - neovim will have to be configured to use Win32Yank
if uname -a | grep -q 'microsoft-standard-WSL2'; then
    export PATH="/mnt/c/Program Files/Win32Yank/:$PATH"
fi

