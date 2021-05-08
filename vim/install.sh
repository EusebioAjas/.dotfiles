#!/bin/sh

#Check if vim is installed
if which vim >/dev/null; then
    echo "vim is already installed...!"
else
    echo "Installing vim..."
    sudo apt install vim
    # Create a new link called .vimrc which comes from ~/(pwd)/.vimrc
    echo "Create symlink for vim configuration..."
    ln -sf $(pwd)/.vimrc ~/.vimrc

    # install indentLine
    echo "Installing indentLine..."
    git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
    vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"

    # install gitgutter
    echo "Installing gitgutter..."
    mkdir -p ~/.vim/pack/airblade/start
    cd ~/.vim/pack/airblade/start
    git clone https://github.com/airblade/vim-gitgutter.git
    vim -u NONE -c "helptags vim-gitgutter/doc" -c q
fi

