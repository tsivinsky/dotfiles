#! /bin/bash

declare -A aliases=(
	["sudo"]="sudo "

	["ls"]="ls --color=auto"
	["l"]="ls"
	["lah"]="ls -lAh"
	["la"]="ls -A"
	["ll"]="ls -l"
	["ed"]="$EDITOR"
	["c"]="clear"
	["t"]="tmux"
	["pacman"]="pacman --color auto"
	["yay"]="yay --color auto"
	["q"]="exit"
	["tree"]="tree -C"

	# Git
	["g"]="git"
	["ga"]="git add"
	["gc"]="git commit"
	["gp"]="git push"
	["gl"]="git log"
	["gs"]="git status"
	["gd"]="git diff"
	["gt"]="git tag"
	["gch"]="git checkout"
	["gpl"]="git pull"
	["gb"]="git branch"
)

for alias in ${!aliases[@]}; do
	cmd=${aliases[$alias]}
	alias "$alias"="$cmd"
	complete -F _complete_alias "$alias"
done
