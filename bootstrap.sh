#!/bin/bash

# Link .vimrc to home directory
ln -s $PWD/.vimrc $HOME/.vimrc

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Source .vimrc
source ~/.vimrc

alacrittyDir="$HOME/.config/alacritty"
i3Dir="$HOME/.config/i3"
polybarDir="$HOME/.config/polybar"
rofiDir="$HOME/.config/rofi"

# Create directories
if [ ! -d "$alacrittyDir"  ] ; then
  mkdir "$alacrittyDir"
fi
if [ ! -d "$i3Dir" ] ; then
  mkdir "$i3Dir"
fi
if [ ! -d "$polybarDir" ] ; then
  mkdir "$polybarDir"
fi
if [ ! -d "$rofiDir" ] ; then
  mkdir "$rofiDir"
fi

# Create symlinks
ln -s $PWD/i3_config $HOME/.config/i3/config
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -s $PWD/polybar/config.ini $HOME/.config/polybar/config
ln -s $PWD/polybar/launch.sh $HOME/.config/polybar/launch.sh
ln -s $PWD/rofi_config.rasi $HOME/.config/rofi/config.rasi
ln -s $PWD/picom.conf $HOME/.config/picom.conf

echo "Install vim plugins from with :PlugInstall command."
echo "After that, install completions for youcompleteme plugin by running this command:"
echo "$HOME/.vim/plugged/youcompleteme/install.py --ts-completer --go-completer"
