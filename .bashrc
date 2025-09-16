# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



#DRS-ADDITIONS
export PATH=$PATH:/home/bluelegend/bin:/home/bluelegend/bin/scripts:/home/bluelegend/bin/scripts/legacy:/home/bluelegend/bin/scripts/at:/home/bluelegend/bin/scripts/at/init:/home/bluelegend/bin/scripts/at/students:/opt:/opt/v:/opt/jetbrains:/home/bluelegend/.local/bin/
export PATH=$PATH:$(which tlmgr)
export PATH=$PATH:/home/bluelegend/scripts

shopt -s extglob
shopt -s globstar

#Opam installation
# 'Make sure your .bashrc is well profiled
#= add following to your ~/.profile:
# test -r /home/bluelegend/.opam/opam-init/init.sh && . /home/bluelegend/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
##eval `opam config env`

# set gvim as default editor
export VISUAL='gvim -f'


#-- drsaliases
alias lsd="ls -1F | grep / | sed 's:/::'"
alias c="cd ..; clear; ls -F"
# function cd {
#   cd $1; ls -F
# }

# vimrds
alias Vimocr="vim -c 'nnoremap å :!scrot<cr><cr>'"

## alias em=emacs-snapshot  #=P.Nordlöw recommendations
## alias e=emacsclient

#-- apt convenience aliases
alias Asearch="apt-cache search"
alias Ainstall="sudo apt-get install"
alias Auninstall="sudo apt-get remove"
alias Apurge="sudo apt-get purge"
# new alias 'FixBroken'
# +NEW TODO: ResetBroken (!!)

# ??
function wdir {
  pwd | sed 's:.*/::'
}

function ding {
  audacious ~/Dropbox/rsc/media/au/sfx/ding.sfx.mp3 &
}
function alarm {
  audacious ~/Dropbox/rsc/media/au/sfx/alarmclock.sfx.mp3 &
}

# legacy def: 'ls -tr | tail -1'
function Last {
  tail -1
}
function First {
  head -1
}

function mkc {
  mkdir -p $1; cd $1
}

function mana {
  man $1 | gvim -
}

function weather {
  curl wttr.in/${1}
}


function sort-by-date() {
  ls | sort -t'_' -k2,2 -r | gvim -
}

## function sort-by-date() {
##     # Define ANSI color codes
##     local RED='\033[0;31m'
##     local NC='\033[0m' # No Color
## 
##     # Use 'find' to get filenames and 'sort' to order them
##     # Use a 'while read' loop to process each filename
##     find . -maxdepth 1 -type f -name "*_*.txt" | sort -t'_' -k2,2 -r | while read -r filename; do
##         # Extract the year from the filename using a robust regex match
##         local year=$(grep -o -E '[0-9]{4}' <<< "$filename")
## 
##         # Replace the first occurrence of the year with the colored version
##         # using Bash's built-in parameter expansion
##         local colored_filename="${filename/${year}/${RED}${year}${NC}}"
## 
##         # Print the final colored filename using printf
##         printf '%s\n' "$colored_filename"
##     done
## }

# # Adding Mappings for Missing Keys on Wireless Keyboard 3
# # For Keyb3: Alt-gr + Lessthan/GreaterThan
# xmodmap ~/.keyb3_altgr-lessgreater.xmodmap
# 
# # guix
# GUIX_PROFILE="/home/bluelegend/.guix-profile"
# . "$GUIX_PROFILE/etc/profile"
# 
# alias android-studio="~/android-studio/bin/./studio.sh"
# alias blue="~/Downloads/blue/bin/blue"
# 
# # SCRATCH/TEMP:
# function ptk {
#   pdftk $1 burst
# }
# 
# # mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-7.0.100-linux-x64.tar.gz -C $HOME/dotnet
# export DOTNET_ROOT=$HOME/dotnet
# export PATH=$PATH:$HOME/dotnet
# 
# [ -f "/home/bluelegend/.ghcup/env" ] && source "/home/bluelegend/.ghcup/env" # ghcup-env
# 
# alias spark-shell="/home/bluelegend/spark-3.3.2-bin-hadoop3/bin/spark-shell"
# 
# export PATH="$PATH:/home/bluelegend/julia-1.8.5/bin"
# 
# export PATH="$PATH:/opt/GNAT/2021/bin"
# 
# source /home/bluelegend/Empire/rsc/config/mssqldb-info
# export DBINFO=$DBINFO
# 
# . "$HOME/.cargo/env"
# 
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# 
