#!/bin/sh

# Check if git is installed
if [ command git 2>/dev/null ]; then
  echo "Installing git..."
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt update
  sudo apt install git
  # Create a new link called .gitconfig which comes from ~/(pwd)/.gitconfig
  echo "Create symlink for gitconfig..." 
  ln -sf $(pwd)/.gitconfig ~/.gitconfig

  # Create a new link called .gitmessage which comes from ~/(pwd)/.gitmessage
  echo "Create symlink for gitmessage..."
  ln -sf $(pwd)/.gitmessage ~/.gitmessage
else
  echo "git is installed...!"
  exit 1;
fi


