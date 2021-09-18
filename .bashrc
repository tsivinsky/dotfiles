# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias lah='ls -lah'
alias la='ls -a'

alias count-commits='echo $(git log --oneline | wc -l) commits'

export TERM=alacritty
export EDITOR=vim
export VISUAL=vim

