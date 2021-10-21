#!/bin/bash

declare -A configs

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

configs=(
  ["$PWD/config/.bashrc"]="$HOME/.bashrc"
  ["$PWD/config/.gitconfig"]="$HOME/.gitconfig"
  ["$PWD/config/nvim"]="$HOME/.config/nvim"
  ["$PWD/config/alacritty"]="$HOME/.config/alacritty"
  ["$PWD/config/i3"]="$HOME/.config/i3"
  ["$PWD/config/polybar"]="$HOME/.config/polybar"
  ["$PWD/config/sway"]="$HOME/.config/sway"
  ["$PWD/config/swaylock"]="$HOME/.config/swaylock"
  ["$PWD/config/waybar"]="$HOME/.config/waybar"
  ["$PWD/config/rofi"]="$HOME/.config/rofi"
  ["$PWD/config/dunst"]="$HOME/.config/dunst"
  ["$PWD/config/fontconfig"]="$HOME/.config/fontconfig"
  ["$PWD/config/wlogout"]="$HOME/.config/wlogout"
  ["$PWD/config/picom.conf"]="$HOME/.config/picom.conf"
)


# Install all configs
if [ "$1" = "-S" ] ; then


# Create symlinks
for config in "${!configs[@]}"
do
  ln -s $config ${configs[$config]}
done

# Install vim-plug
nvimDir="${configs[$PWD/config/nvim]}"
mkdir -p $nvimDir/autoload
wget -O $nvimDir/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
nvim -c "PlugInstall"

fi

# Remove all configs
if [ "$1" = "-R" ] ; then

cd $HOME
for config in "${!configs[@]}"
do
  rm -rf ${configs[$config]}
done

fi

if [ "$1" = "-U" ] ; then
  archPackages=$(cat apps.list)
  aurPackages=$(cat apps.aur)

  echo "Installing Arch packages... "
  echo "We need your sudo privileges"
  sudo pacman -S $archPackages --noconfirm --needed 
fi
