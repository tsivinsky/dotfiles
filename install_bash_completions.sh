#!/bin/bash

# complete_alias is a script that allows to use completion in aliases
declare -A bashCompletions=(
	["complete_alias"]="https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias"
	["tmux"]="https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/tmux.completion.bash"
	["git"]="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
)

bashCompletionsDir="$HOME/.config/bash-completions"

__install_bash_completions() {
	if [[ ! -d "$bashCompletionsDir" ]]; then
		mkdir "$bashCompletionsDir"
	fi

	for cmp in "${!bashCompletions[@]}"; do
		source=${bashCompletions[$cmp]}
		dest="$bashCompletionsDir/$cmp.bash"

		if [[ ! -f "$dest" ]]; then
			echo "Downloading $cmp completion"
			curl "$source" -o "$dest" &>/dev/null
		fi
	done
}

__install_bash_completions
