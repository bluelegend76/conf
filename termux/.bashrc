# Termux-Specific Setup and Environment
# Termux installation-directory /data/data/com.termux/files/usr is $PREFIX

# Termux specific environment variables
export EDITOR='vim'
export VISUAL='vim'

# Alias for Termux's package-manager
alias update='pkg update -y && pkg upgrade -y'
alias install='pkg install'
alias search='pkg search'

# Aliases for Efficiency ----
# Basic aliases
alias ls='ls --color=auto -ACF'  # Colorize and format ls output (A: almost all, C: columns, F: classify)
alias ll='ls -alF'               # Long list format (a: all, l: long, F: classify)
alias l='ls -CFlh'               # Compact long list (C: columns, F: classify, l: long, h: human-readable sizes)

# Directory-Navigation Shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Common utility-aliases
alias rm='rm -i'    # Add confirmation for removals (prevents accidental deletion)
alias cp='cp -iv'   # Interactive and verbose copy
alias mv='mv -iv'   # Interactive and verbose move
alias mkdir='mkdir -pv' # Create parent directories as needed and print a message
alias grep='grep --color=auto' # Colorize grep output

# A custom prompt (PS1) can display
# useful information like
# - your current directory
# - Git status
# - and a clear distinction when
# running as root (if you use tsu
# or a proot distribution).

# Simple and clear custom prompt
# Example format: [user@home:cwd]$ 
#  \u: username
#  \h: hostname
#  \w: current working directory
#  \$: prompt symbol
# Termux's default is usually good,
# but this gives you a starting
# point for customization.

# # Define colors for better visibility (optional)
# COLOR_NC='\033[0m'    # No Color
# COLOR_GREEN='\033[0;32m'
# COLOR_BLUE='\033[0;34m'
# COLOR_RED='\033[0;31m'
#
# # Check if user is root (prompt is
# # #) or regular user (prompt is $)
# if [[ $UID -eq 0 ]]; then
#     PS1="${COLOR_RED}\u@\h:${COLOR_BLUE}\w${COLOR_RED}# ${COLOR_NC}"
# else
#     PS1="${COLOR_GREEN}\u@\h:${COLOR_BLUE}\w${COLOR_NC}\$ "
# fi
#
# export PS1

# Helpful Functions ----

# Create a directory and immediately change into it
mkc () {
    mkdir -p "$1"
    cd "$1"
}

# Run update, then clean up old packages
fullupdate() {
    pkg update -y && pkg upgrade -y
    pkg autoclean
    pkg autoremove
}

# Check and update the key for
# Termux (sometimes needed)
termux_key_update() {
    pkg install termux-keyring
    pkg update
}

# PATH ----
export PATH="$HOME/conf:$HOME/bin:$HOME/.local/bin:$PATH"

# Add specific project-directories from the repos-folder
# export PATH="$HOME/repos//bin:$PATH"
# export PATH="$HOME/repos//scripts:$PATH"

