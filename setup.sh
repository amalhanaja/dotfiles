#!/bin/bash

function install_homebrew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # echo >&2 "I require foo but it's not installed.  Aborting."
}

function install_brewfile() {
    echo "Installing using Brewfile"
    brew bundle
}

command -v brew >/dev/null 2>&1 || install_homebrew
install_brewfile