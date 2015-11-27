#!/bin/bash

#sudo pacman -S vim zsh vim-nerdtree vim-colorsamplepack
#yaourt oh-my-zsh-git

cd ~simao;

ln -sf ~simao/dotfiles/zshrc ~simao/.zshrc
ln -sf ~simao/dotfiles/vimrc ~simao/.vimrc
sudo ln -sf ~simao/dotfiles/simon.zsh-theme /usr/share/oh-my-zsh/themes
sudo ln -sf ~simao/dotfiles/simon-root.zsh-theme /usr/share/oh-my-zsh/themes
