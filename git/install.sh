#!/bin/sh

# Check if git is installed
if command -v git &> /dev/null
then
  echo "git already is installed...!"
else
  echo "<git> could not found"

  echo "Setup user name and git message template..."
  # Create a new link called .gitconfig which comes from ~/(pwd)/.gitconfig
  echo "Create symlink for gitconfig..." 
  ln -sf $(pwd)/.gitconfig ~/.gitconfig

  # Create a new link called .gitmessage which comes from ~/(pwd)/.gitmessage
  echo "Create symlink for gitmessage..."
  ln -sf $(pwd)/.gitmessage ~/.gitmessage
fi

