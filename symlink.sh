#!/bin/bash

# variables
dotfiles_dir=~/dotfiles


# create dirs
mkdir ~/.config/terminator/

# create symlinks
sudo ln -sf $dotfiles_dir/vimrc ~/.vimrc
sudo ln -sf $dotfiles_dir/bash_aliases ~/.bash_aliases
sudo ln -sf $dotfiles_dir/terminator_config ~/.config/terminator/config

