#!/bin/bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Source .vimrc
source ~/.vimrc

# Create symlinks
ln -s $PWD/i3_config $HOME/.config/i3/config
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -s $PWD/polybar/config $HOME/.config/polybar/config
ln -s $PWD/polybar/launch.sh $HOME/.config/polybar/launch.sh
ln -s $PWD/rofi_config.rasi $HOME/.config/rofi/config.rasi
