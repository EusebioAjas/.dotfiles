#!/bin/sh

# Check if zsh is installed
if which zsh >/dev/null; then
  echo "zsh is installed...!"
else
  echo "Installing zsh..."
  # For more info: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
  sudo apt install zsh
  zsh --version
  
  # Set as default shell
  chsh -s $(which zsh)
fi

echo "Installing Oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Spaceship ZSH..."
# For more info: https://github.com/denysdovhan/spaceship-prompt

# Installing  Powerline Font
sudo apt install fonts-powerline

# Clone the repo:
# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

# Create a new symlink spaceship.zsh-theme to your oh-my-zsh custom themes directory:
# echo "Create a symlink for spacheship.zsh-theme..."
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

echo "Create a symlink for zsh..."
ln -sf $(pwd)/.zshrc ~/.zshrc

