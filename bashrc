#!/bin/bash

# return if ! interactive
[ -z "$PS1" ] && return

# Terminal Options
TERM=screen-256color
shopt -s checkwinsize
shopt -s histappend

# Source Completion files
for file in $HOME/code/dotfiles/completion/*; do source $file && unset file; done

# Paths
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export JAVA_OPTS="-XX:-UseSplitVerifier"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
export PATH=$HOME/.bin:$PATH
export WORKON_HOME=$HOME/.virtualenvs

test -f /usr/local/bin/virtualenvwrapper.sh && . /usr/local/bin/virtualenvwrapper.sh

# Folder Colouring
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Regular Colors
BLACK='\e[0;30m'        # Black
RED='\e[0;31m'          # Red
GREEN='\e[0;32m'        # Green
YELLOW='\e[0;33m'       # Yellow
BLUE='\e[0;34m'         # Blue
PURPLE='\e[0;35m'       # Purple
CYAN='\e[0;36m'         # Cyan
WHITE='\e[0;37m'        # White
RESET="\033[m"

# PS1 and Prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

PS1="\[$GREEN\]\u\[$WHITE\]:\[$RED\]\w\[$CYAN\]\$(__git_ps1)\$ \[$RESET\]"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
