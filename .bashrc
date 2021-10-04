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

alias count-commits='echo $(git log --oneline | wc -l) commits'

alias e='$EDITOR'




#  _____ _   ___     _____ ____   ___  _   _ __  __ _____ _   _ _____ 
# | ____| \ | \ \   / /_ _|  _ \ / _ \| \ | |  \/  | ____| \ | |_   _|
# |  _| |  \| |\ \ / / | || |_) | | | |  \| | |\/| |  _| |  \| | | |  
# | |___| |\  | \ V /  | ||  _ <| |_| | |\  | |  | | |___| |\  | | |  
# |_____|_| \_|  \_/  |___|_| \_\\___/|_| \_|_|  |_|_____|_| \_| |_|  
#                                                                     

export TERM=alacritty
export EDITOR=nvim
export VISUAL=nvim

# Use thefuck command to fix previous command
eval "$(thefuck --alias)"

# Find arch package by binary
source /usr/share/doc/pkgfile/command-not-found.bash

shopt -s autocd
