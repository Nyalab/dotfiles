#!/usr/bin/env bash

if ! type "brew" >/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! type "zsh" >/dev/null; then
  brew install zsh
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
  echo "the term app must be relaunched to use zsh"
fi
