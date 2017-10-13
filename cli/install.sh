#!/bin/sh -x

brew install zsh
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
echo "restart l'application de terminal pour finir l'install de zsh"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

if [ ! -f "$HOME/.zshrc" ]; then
  ln -s "$HOME/dotfiles/cli/zshrc" "$HOME/.zshrc"
fi
