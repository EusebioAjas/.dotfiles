#!/bin/sh

#Check if tmux is installed
if which tmux >/dev/null; then
    echo "tmux is installed...!"
else
    echo "Installing tmux..."
    sudo apt install tmux
fi

# Create a new link called .tmux.conf which comes from ~/(pwd)/.tmux.conf
echo "Create symlink for tmux configuration..."
ln -sf ~/$(pwd)/.tmux.conf ~/.tmux.conf