#! /bin/bash

mc() {
	dir="$1"

	mkdir -p $dir
	cd $dir
}

newgo() {
	dir="$1"

	mkdir -p $dir
	cd $dir

	go mod init $1

	nap go/pkgm >main.go
}

declare -A aliases=(
	["sudo"]="sudo "

	["ls"]="ls --color=auto"
	["l"]="ls"
	["lah"]="ls -lAh"
	["la"]="ls -A"
	["ll"]="ls -l"
	["ed"]="$EDITOR"
	["c"]="clear"
	["pacman"]="pacman --color auto"
	["yay"]="yay --color auto"
	["q"]="exit"
	["tree"]="tree -C"

	# Tmux
	["t"]="tmux"
	["tl"]="tmux ls"
	["ta"]="tmux attach"
	["tn"]="tmux new-session"

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
	["gm"]="git merge"
	["gr"]="git restore"
)

for alias in ${!aliases[@]}; do
	cmd=${aliases[$alias]}
	alias "$alias"="$cmd"
	complete -F _complete_alias "$alias"
done
