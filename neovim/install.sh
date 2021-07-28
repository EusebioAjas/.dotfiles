#!/bin/sh

#Check if neovim is intalled
if which nvim >/dev/null; then
  echo "neovim is already installed...!"
else
  echo "Installing neovim..."
  sudo add-apt-repository ppa:neovim-ppa/lastest
  sudo apt update
  sudo apt install neovim

  # Create a link called .vimrc which comes from ~/(pwd)/.vimrc
  echo "Create a symlink for neovim configuration..."
  ln -sf $(pwd)/.vimrc ~/.vimrc

	# enhacement symlink when is created, TODO: create a folder
  echo "Create a symlink for init neovim config"
  mkdir -p ~/.config/nvim
  ln -sf $(pwd)/.config/nvim/init.vim ~/.config/nvim/init.vim

	echo "Installing plug-vim"
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -sf $(pwd)/.config/nvim/autoload/plug.vim ~/.config/nvim/autoload/plug.vim

	echo "Create a symlink for plug-vim config"
	mkdir -p ~/.config/nvim/vim-plug
 	ln -sf $(pwd)/.config/nvim/vim-plug/plugins.vim ~/.config/nvim/vim-plug/plugins.vim
fi

