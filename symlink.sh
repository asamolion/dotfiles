#!/bin/bash

# variables
dotfiles_dir=~/dotfiles


# create dirs
mkdir -p ~/.config/terminator/
mkdir -p ~/.config/nvim/

# create symlinks
sudo ln -sf $dotfiles_dir/vimrc ~/.vimrc
sudo ln -sf $dotfiles_dir/zshrc ~/.zshrc
sudo ln -sf $dotfiles_dir/bash_aliases ~/.bash_aliases
sudo ln -sf $dotfiles_dir/zsh_aliases ~/.zsh_aliases
sudo ln -sf $dotfiles_dir/terminator_config ~/.config/terminator/config
sudo ln -sf $dotfiles_dir/neovintageousrc ~/.config/sublime-text/Packages/User/.neovintageousrc
sudo ln -sf $dotfiles_dir/init.vim ~/.config/nvim/init.vim


git config --global core.editor "vim"
