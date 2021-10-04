#!/bin/bash

usage() {
  echo "usage: (./)bootstrap [-S][-R]"
  echo
  echo "  -S installs all this shit"
  echo "  -R removes all this shit"
}

if [ $# -eq 0 ] ; then
  usage
fi

# Variables for directories
nvimDir="$HOME/.config/nvim"
alacrittyDir="$HOME/.config/alacritty"
i3Dir="$HOME/.config/i3"
polybarDir="$HOME/.config/polybar"
rofiDir="$HOME/.config/rofi"
picomFile="$HOME/.config/picom.conf"
gitconfigFile="$HOME/.gitconfig"

# Install all configs
if [ "$1" = "-S" ] ; then

ln -s $PWD/.bashrc $HOME/.bashrc

# Create symlinks
ln -s $PWD/nvim $nvimDir
ln -s $PWD/i3 $i3Dir
ln -s $PWD/alacritty $alacrittyDir
ln -s $PWD/polybar $polybarDir
ln -s $PWD/rofi $rofiDir
ln -s $PWD/picom.conf $picomFile
ln -s $PWD/.gitconfig $gitconfigFile

# Install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Install neovim plugins with :PlugInstall command inside neovim"

fi

# Remove all configs
if [ "$1" = "-R" ] ; then

cd && rm -rf .bashrc $nvimDir $alacrittyDir $i3Dir $polybarDir $rofiDir $picomFile $gitconfigFile && cd -

fi

