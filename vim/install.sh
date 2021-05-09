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
    cd ~/.vim
    git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
    vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"

    # install gitgutter
    echo "Installing gitgutter..."
    mkdir -p ~/.vim/pack/airblade/start
    cd ~/.vim/pack/airblade/start
    git clone https://github.com/airblade/vim-gitgutter.git
    vim -u NONE -c "helptags vim-gitgutter/doc" -c q

    # install pathogen
    echo "Installing pathogen..."
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  
    # install vim rails
    echo "installing vim-rails..."
    cd ~/.vim/bundle
    git clone https://github.com/tpope/vim-rails.git
    vim -u NONE -c "helptags vim-rails/doc" -c q

    # install vim ruby
    echo "Installing vim-ruby..."
    cd ~/.vim
    git clone git://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby
fi

