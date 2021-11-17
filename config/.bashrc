# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#  _____ _   ___     _____ ____   ___  _   _ __  __ _____ _   _ _____ 
# | ____| \ | \ \   / /_ _|  _ \ / _ \| \ | |  \/  | ____| \ | |_   _|
# |  _| |  \| |\ \ / / | || |_) | | | |  \| | |\/| |  _| |  \| | | |  
# | |___| |\  | \ V /  | ||  _ <| |_| | |\  | |  | | |___| |\  | | |  
# |_____|_| \_|  \_/  |___|_| \_\\___/|_| \_|_|  |_|_____|_| \_| |_|  
#                                                                     

export DOTFILES="$HOME/dotfiles"

export TERM=alacritty
export EDITOR=nvim
export VISUAL=nvim

# Go ENVs
export GO111MODULE=auto
export GOBIN="$HOME/go/bin"

MY_BIN="$DOTFILES/bin"
RUSTBIN="$HOME/.cargo/bin"
PYTHON_BIN="$HOME/.local/bin"

export PATH="$PATH:$MY_BIN:$PYTHON_BIN:$RUSTBIN:$GOBIN"


# Source bash completions
source $HOME/.config/bash-completions/*

# Install aliases
source $DOTFILES/config/bash/aliases.bash

# Find arch package by binary
source /usr/share/doc/pkgfile/command-not-found.bash

shopt -s autocd

_GREEN="\[\033[32m\]"
_BLUE="\[\033[34m\]"
_BOLD="\[\033[1m\]"
_RESET="\[\033[0m\]"
export PS1="${_GREEN}${_BOLD}\u@\h${_RESET}:${_BLUE}${_BOLD}\W${_RESET} # "

# Vim everywhere
set -o vi

# Show calendar and date on start
cal -m
date +"%d %B %Y - %H:%M:%S, %A"

# GitHub zen
githubToken=$(cat "$HOME/.config/github-token.secret")
if [[ "$githubToken" != "" ]] ; then
  echo -n 'Zen: "'
  curl -H "Authorization: token $githubToken" https://api.github.com/zen
  echo '"'
fi
