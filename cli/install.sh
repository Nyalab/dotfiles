#!/usr/bin/env bash

brew install zsh-syntax-highlighting

. install_prezto.zsh

ln -sf "$HOME/dotfiles/cli/zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/cli/zpreztorc" "$HOME/.zpreztorc"

