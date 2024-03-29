# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /usr/share/git/git-prompt.sh ]; then
	source /usr/share/git/git-prompt.sh
fi

export EDITOR=nvim
export VISUAL=nvim

export DOTFILES="$HOME/dotfiles"

export HISTSIZE=10000

# Go ENVs
export GO111MODULE=auto
export GOBIN="$HOME/go/bin"

MY_BIN="$DOTFILES/bin"
RUST_BIN="$HOME/.cargo/bin"
PYTHON_BIN="$HOME/.local/bin"
ANDROID_BIN="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools"
BUN_INSTALL="$HOME/.bun"
BUN_BIN="$BUN_INSTALL/bin"

export PATH="$PATH:$MY_BIN:$PYTHON_BIN:$RUST_BIN:$GOBIN:$ANDROID_BIN:$BUN_BIN"

source $HOME/.config/bash-completions/*
source $HOME/.config/bash/aliases.bash

shopt -s autocd

_GREEN="\[\033[32m\]"
_BLUE="\[\033[34m\]"
_RED="\[\033[31m\]"
_BOLD="\[\033[1m\]"
_RESET="\[\033[0m\]"
PS1=$_BLUE$_BOLD'\w'$_RESET$_RED$_BOLD'$(__git_ps1 " [%s]")'$_RESET' \$ '

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

TZ=:/etc/localtime

export FONTCONFIG_PATH=/etc/fonts
