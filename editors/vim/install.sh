#!/usr/bin/env bash

# symlink config
ln -sfn ~/dotfiles/editors/vim ~/.vim

# install vim-plug
if [ ! -f "./autoload/vim/plug.vim" ]; then
  curl -fLo ./autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall
