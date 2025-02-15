#!/bin/sh

ln -s ~/dotfiles/alacritty/ ~/.config/
ln -s ~/dotfiles/i3/ ~/.config/
ln -s ~/dotfiles/i3status/ ~/.config/
cp -r ~/.vim ~/.vim_old; mkdir ~/.vim/; ln -s ~/dotfiles/vim/ftplugin/ ~/.vim/; ln -s ~/dotfiles/vim/spell/ ~/.vim/; ln -s ~/dotfiles/vim/UltiSnips/ ~/.config/; ln -s ~/dotfiles/nvim/ ~/.config/
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/zathura/ ~/.config/

ln -s ~/dotfiles/bash/.bashrc ~/
ln -s ~/dotfiles/tmux/.tmux.conf ~/

mkdir ~/.local/bin/
ln -s ~/dotfiles/scripts/ ~/.local/bin/
