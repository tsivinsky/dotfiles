# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '

alias ls='ls --color=auto'
alias lah='ls -lah'
alias la='ls -a'

alias count-commits='echo $(git log --oneline | wc -l) commits'

alias e='$EDITOR'

export TERM=alacritty
export EDITOR=nvim
export VISUAL=nvim

export PATH="$PATH:$HOME/scripts"

