#!/bin/sh

# Check if tmux is installed
if [ command tmux 2>/dev/null ]; then
    echo "Not installed"
    sudo apt install tmux
    # Create a new link called .tmux.conf which comes from ~/(pwd)/.tmux.conf
    echo "Create symlink for tmux configuration..."
    ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
    # dir for tmux-plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux is installed...!"
    exit 1;
fi

