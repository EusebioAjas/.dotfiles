#!/bin/sh

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "Installing tmux..."
    sudo apt install tmux
    # Create a new link called .tmux.conf which comes from ~/(pwd)/.tmux.conf
    echo "Create symlink for tmux configuration..."
    ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
    # dir for tmux-plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux is already installed!"
    exit 1;
fi

