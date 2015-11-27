#!/bin/bash

#sudo pacman -S vim zsh vim-nerdtree vim-colorsamplepack
#yaourt oh-my-zsh-git

cd ~simao;

ln -sf dotfiles/zshrc .zshrc
ln -sf dotfiles/vimrc .vimrc
sudo ln -sf dotfiles/simon.zsh-theme /usr/share/oh-my-zsh/themes
sudo ln -sf dotfiles/simon-root.zsh-theme /usr/share/oh-my-zsh/themes
