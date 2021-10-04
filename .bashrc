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

alias e='$EDITOR'
alias copy='xclip -selection clipboard'
alias count='wc -l'
alias aw='awman'


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

for file in $completions
do
  source "/usr/share/bash-completion/completions/$file"
done
