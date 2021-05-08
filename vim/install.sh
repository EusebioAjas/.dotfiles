#!/bin/sh

#Check if vim is installed
if which vim >/dev/null; then
    echo "vim is installed...!"
else
    echo "Installing vim..."
    sudo apt install vim
fi

# Create a new link called .vimrc which comes from ~/(pwd)/.vimrc
echo "Create symlink for vim configuration..."
ln -sf $(pwd)/.vimrc ~/.vimrc
