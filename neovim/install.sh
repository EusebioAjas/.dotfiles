#!/bin/sh

#Check if neovim is intalled
if [ command nvim 2>/dev/null ]; then
  echo "Installing neovim..."
  sudo add-apt-repository ppa:neovim-ppa/lastest
  sudo apt update
  sudo apt install neovim

  # Create a link called .vimrc which comes from ~/(pwd)/.vimrc
  echo "Create a symlink for neovim configuration..."
  ln -sf $(pwd)/.vimrc ~/.vimrc

	# enhacement symlink when is created
  echo "Create a symlink for init neovim config"
  mkdir -p ~/.config/nvim/init.lua
  ln -sf $(pwd)/.config/nvim/init.vim ~/.config/nvim/init.vim
else
  echo "nvim is installed..!"
  exit 1;
fi
