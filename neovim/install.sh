#!/bin/sh

#Check if neovim is intalled
if which neovim >/dev/null; then
  echo "neovim is already installed...!"
else
  echo "Installing neovim..."
  sudo apt install neovim
  # Create a link called .vimrc which comes from ~/(pwd)/.vimrc
  echo "Create a symlink for neovim configuration..."
  ln -sf $(pwd)/.vimrc ~/.vimrc
fi

