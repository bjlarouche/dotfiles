#!/bin/bash

##### bash aliases
alias atom="atom ./"
alias code="code ./"
# a better list all
alias ls="ls -a"
# show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
# update/reloat bash_profile
alias reload="source ~/.bash_profile"
# open current directory in finder
alias finder="open ."

##### TODO bash_autocomplete

##### bash exports
export EDITOR="code"
export PATH="/usr/local/bin:$PATH"
# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups

# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=10000

# Increase the maximum number of commands to remember
# (default is 500)
export HISTSIZE=10000

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use stable # use stable by default for a new session

# bash completion config
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

##### bash functions
weather() {
    city="$1"

    if [ -z "$city" ]; then
        city="Austin"
    fi

    eval "curl http://wttr.in/${city}"
}

##### bash options
# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob


##### bash prompt
. "$HOME/.bash_prompt"

#bash.local - for local settings that shouldn't be under version control
