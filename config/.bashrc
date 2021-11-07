# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#     _    _     ___    _    ____  _____ ____  
#    / \  | |   |_ _|  / \  / ___|| ____/ ___| 
#   / _ \ | |    | |  / _ \ \___ \|  _| \___ \ 
#  / ___ \| |___ | | / ___ \ ___) | |___ ___) |
# /_/   \_\_____|___/_/   \_\____/|_____|____/ 
#                                             

alias sudo='sudo '

alias ls='ls --color=auto'
alias lah='ls -lah'
alias la='ls -a'

alias ed='$EDITOR'
alias c='clear'

# Git aliases
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gt='git tag'
alias gch='git checkout'


#  _____ _   ___     _____ ____   ___  _   _ __  __ _____ _   _ _____ 
# | ____| \ | \ \   / /_ _|  _ \ / _ \| \ | |  \/  | ____| \ | |_   _|
# |  _| |  \| |\ \ / / | || |_) | | | |  \| | |\/| |  _| |  \| | | |  
# | |___| |\  | \ V /  | ||  _ <| |_| | |\  | |  | | |___| |\  | | |  
# |_____|_| \_|  \_/  |___|_| \_\\___/|_| \_|_|  |_|_____|_| \_| |_|  
#                                                                     

export TERM=alacritty
export EDITOR=nvim
export VISUAL=nvim

# Go ENVs
export GO111MODULE=auto
export GOBIN="$HOME/go/bin"

MY_BIN="$HOME/dotfiles/bin"
RUSTBIN="$HOME/.cargo/bin"
PYTHON_BIN="$HOME/.local/bin"

export PATH="$PATH:$MY_BIN:$PYTHON_BIN:$RUSTBIN:$GOBIN"

# Find arch package by binary
source /usr/share/doc/pkgfile/command-not-found.bash

shopt -s autocd

_GREEN="\[\033[32m\]"
_BLUE="\[\033[34m\]"
_BOLD="\[\033[1m\]"
_RESET="\[\033[0m\]"
export PS1="${_GREEN}${_BOLD}\u@\h${_RESET}:${_BLUE}${_BOLD}\W${_RESET} # "


#   ____ ___  __  __ ____  _     _____ _____ ___ ___  _   _ 
#  / ___/ _ \|  \/  |  _ \| |   | ____|_   _|_ _/ _ \| \ | |
# | |  | | | | |\/| | |_) | |   |  _|   | |  | | | | |  \| |
# | |__| |_| | |  | |  __/| |___| |___  | |  | | |_| | |\  |
#  \____\___/|_|  |_|_|   |_____|_____| |_| |___\___/|_| \_|
#                                                          

completions=(
  "git"
  "pacman"
  "systemctl"
  "yay"
)

for file in ${completions[@]}
do
  source "/usr/share/bash-completion/completions/$file"
done
