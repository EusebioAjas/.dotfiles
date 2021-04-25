#!/bin/sh

# Check if git is installed
if which git >/dev/null; then
  echo "git is installed...!"
else
  echo "Installing git..."
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt update
  sudo apt install git
fi

# Create a new link called .gitconfig which comes from ~/(pwd)/.gitconfig
echo "Create symlink for gitconfig..." 
ln -sf $(pwd)/.gitconfig ~/.gitconfig

# Create a new link called .gitmessage which comes from ~/(pwd)/.gitmessage
echo "Create symlink for gitmessage..."
ln -sf $(pwd)/.gitmessage ~/.gitmessage

