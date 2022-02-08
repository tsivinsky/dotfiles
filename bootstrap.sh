#!/bin/bash

# complete_alias is a script that allows to use completion in aliases
declare -A bashCompletions=(
	["complete_alias"]="https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias"
	["tmux"]="https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/tmux.completion.bash"
	["git"]="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
)

declare -A configs=(
	["$PWD/config/.bashrc"]="$HOME/.bashrc"
	["$PWD/config/.inputrc"]="$HOME/.inputrc"
	["$PWD/config/.gitconfig"]="$HOME/.gitconfig"
	["$PWD/config/.tmux.conf"]="$HOME/.tmux.conf"
	["$PWD/config/nvim"]="$HOME/.config/nvim"
	["$PWD/config/alacritty"]="$HOME/.config/alacritty"
	["$PWD/config/rofi"]="$HOME/.config/rofi"
	["$PWD/config/dunst"]="$HOME/.config/dunst"
	["$PWD/config/fontconfig"]="$HOME/.config/fontconfig"
	["$PWD/config/sway"]="$HOME/.config/sway"
	["$PWD/config/swaylock"]="$HOME/.config/swaylock"
	["$PWD/config/waybar"]="$HOME/.config/waybar"
	["$PWD/config/wlogout"]="$HOME/.config/wlogout"
	["$PWD/config/swappy"]="$HOME/.config/swappy"
	["$PWD/config/lf"]="$HOME/.config/lf"
	["$PWD/config/kitty"]="$HOME/.config/kitty"
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

usage() {
	echo "usage: (./)bootstrap.sh [-S][-R]"
	echo
	echo "  -S installs all this shit"
	echo "  -R removes all this shit"
	echo "  -I downloads bash completions"
}

if [ $# -eq 0 ]; then
	usage
fi

# Install all configs
if [ "$1" = "-S" ]; then
	# Create symlinks
	for config in "${!configs[@]}"; do
		ln -s $config ${configs[$config]}
	done

	# Install packer.nvim
	mkdir ~/.local/share/nvim/site/pack
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
		~/.local/share/nvim/site/pack/packer/start/packer.nvim

	# Install vim plugins
	nvim -c "PackerInstall"

	if [[ ! -d "$bashCompletionsDir" ]]; then
		__install_bash_completions
	fi
fi

# Remove all configs
if [ "$1" = "-R" ]; then
	for config in "${!configs[@]}"; do
		rm -rf ${configs[$config]}
	done

	rm -rf "$bashCompletionsDir"
fi

# Install bash completions defined in hashmap above
if [ "$1" = "-I" ]; then
	__install_bash_completions
fi
