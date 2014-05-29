USER=$(whoami)
cd /home/$USER

chown -R $USER:$USER .oh-my-zsh
chown -R $USER:$USER .${USER}-dotfiles

ln -s .${USER}-dotfiles/${USER}.zsh-theme .oh-my-zsh/themes/
ln -s .${USER}-dotfiles/.zshrc .zshrc
ln -s .${USER}-dotfiles/.vimrc .vimrc

ln -s .${USER}-dotfiles/jellybeans.vim .vim/colors/
ln -s .${USER}-dotfiles/dw_cyan.vim .vim/colors/
