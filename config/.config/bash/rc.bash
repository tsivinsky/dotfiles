if [ -f /usr/share/git/git-prompt.sh ]; then
	source /usr/share/git/git-prompt.sh
elif [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
	source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

export EDITOR=nvim
export VISUAL=nvim

export DOTFILES="$HOME/dotfiles"

export HISTSIZE=10000

export MANPAGER="nvim +Man!"

# Go ENVs
export GO111MODULE=auto
export GOBIN="$HOME/go/bin"

MY_BIN="$DOTFILES/bin"
RUST_BIN="$HOME/.cargo/bin"
PYTHON_BIN="$HOME/.local/bin"

export PATH="$PATH:$MY_BIN:$PYTHON_BIN:$RUST_BIN:$GOBIN"

source $HOME/.config/bash-completions/*
source $HOME/.config/bash/aliases.bash

shopt -s autocd

_GREEN="\[\033[32m\]"
_BLUE="\[\033[34m\]"
_RED="\[\033[31m\]"
_BOLD="\[\033[1m\]"
_RESET="\[\033[0m\]"
PS1=$_BLUE$_BOLD'\w'$_RESET$_RED$_BOLD'$(__git_ps1 " [%s]")'$_RESET' \$ '
