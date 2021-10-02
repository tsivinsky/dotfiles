#!/bin/bash

createDir() {
  if [ ! -d "$1"  ] ; then
    mkdir "$1"
  fi
}

# Variables for directories
nvimDir="$HOME/.config/nvim"
alacrittyDir="$HOME/.config/alacritty"
i3Dir="$HOME/.config/i3"
polybarDir="$HOME/.config/polybar"
rofiDir="$HOME/.config/rofi"

# Install all configs
if [ "$1" = "-S" ] ; then

ln -s $PWD/.bashrc $HOME/.bashrc

# Create directories
createDir $nvimDir
createDir "$nvimDir/plugged"
createDir $alacrittyDir
createDir $i3Dir
createDir $polybarDir
createDir $rofiDir

# Link nvim configuration file
ln -s $PWD/nvim/init.vim $HOME/.config/nvim/init.vim

# Install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create symlinks
ln -s $PWD/i3_config $HOME/.config/i3/config
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -s $PWD/polybar/config.ini $HOME/.config/polybar/config
ln -s $PWD/polybar/launch.sh $HOME/.config/polybar/launch.sh
ln -s $PWD/rofi_config.rasi $HOME/.config/rofi/config.rasi
ln -s $PWD/picom.conf $HOME/.config/picom.conf

echo "Install neovim plugins with :PlugInstall command inside neovim"

fi

# Remove all configs
if [ "$1" = "-R" ] ; then

cd && rm -rf .bashrc $nvimDir $alacrittyDir $i3Dir $polybarDir $rofiDir && cd -

fi

