#!/bin/bash

dir=$HOME/dotfiles

function install_homebrew() {
    echo "Installing Homebrew.."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/usr/local/bin/brew shellenv)"
    echo "Homebrew Installed"
}

function install_brewfile() {
    echo "Installing using Brewfile"
    brew bundle
}

function link_files() {
    rm -rf $dir
    mkdir $dir
    cp -a . $dir
    ln -sfn $dir/.gitconfig $HOME/.gitconfig 
    ln -sfn $dir/.zshrc $HOME/.zshrc
    ln -sfn $dir/.zshenv $HOME/.zshenv
    ln -sfn $dir/Brewfile $HOME/Brewfile
}

command -v brew >/dev/null 2>&1 || install_homebrew
link_files
install_brewfile