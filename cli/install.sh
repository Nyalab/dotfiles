#!/usr/bin/env bash

brew install zsh
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
echo "restart l'application de terminal pour finir l'install de zsh"

brew install zsh-syntax-highlighting

. install_prezto.zsh

ln -sf "$HOME/dotfiles/cli/zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/cli/zpreztorc" "$HOME/.zpreztorc"

