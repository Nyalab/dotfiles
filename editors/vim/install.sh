#!/usr/bin/env bash

# install vim-plug
curl -fLo ~/dotfiles/editors/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symlink config
ln -sfn ~/dotfiles/editors/vim ~/.vim

#vim plugins install
vim +PlugInstall
