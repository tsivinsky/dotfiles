#!/bin/bash

usage() {
  echo "usage: (./)bootstrap [-S][-R]"
  echo
  echo "  -S installs all this shit"
  echo "  -R removes all this shit"
  echo "  -U updates or installs all packages"
}

if [ $# -eq 0 ] ; then
  usage
fi

# Variables for directories
bashrc="$HOME/.bashrc"
nvimDir="$HOME/.config/nvim"
alacrittyDir="$HOME/.config/alacritty"
i3Dir="$HOME/.config/i3"
polybarDir="$HOME/.config/polybar"
swayDir="$HOME/.config/sway"
waybarDir="$HOME/.config/waybar"
rofiDir="$HOME/.config/rofi"
dunstDir="$HOME/.config/dunst"
fontsDir="$HOME/.config/fontconfig"
wlogoutDir="$HOME/.config/wlogout"
picomFile="$HOME/.config/picom.conf"
gitconfigFile="$HOME/.gitconfig"
nvimPluggedDir="$HOME/dotfiles/nvim/plugged"


# Install all configs
if [ "$1" = "-S" ] ; then


# Create symlinks
ln -s $PWD/.bashrc $bashrc
ln -s $PWD/nvim $nvimDir
ln -s $PWD/i3 $i3Dir
ln -s $PWD/alacritty $alacrittyDir
ln -s $PWD/polybar $polybarDir
ln -s $PWD/sway $swayDir
ln -s $PWD/waybar $waybarDir
ln -s $PWD/rofi $rofiDir
ln -s $PWD/dunst $dunstDir
ln -s $PWD/fontconfig $fontsDir
ln -s $PWD/wlogout $wlogoutDir
ln -s $PWD/picom.conf $picomFile
ln -s $PWD/.gitconfig $gitconfigFile

# Install vim-plug
mkdir -p $nvimDir/autoload
wget -O $nvimDir/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
nvim -c "PlugInstall"

fi

# Remove all configs
if [ "$1" = "-R" ] ; then

cd && rm -rf \
  $bashrc $nvimDir $alacrittyDir $i3Dir \
  $polybarDir $swayDir $waybarDir $rofiDir \
  $dunstDir $fontsDir $picomFile $gitconfigFile \
  $nvimPluggedDir \
  && cd -

fi

if [ "$1" = "-U" ] ; then
  archPackages=$(cat apps.list)
  aurPackages=$(cat apps.aur)

  echo "Installing Arch packages... "
  echo "We need your sudo privileges"
  sudo pacman -S $archPackages --noconfirm --needed 
fi
