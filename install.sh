#!/usr/bin/env bash

function command_exists() {
  type "$1" > /dev/null 2>&1
}

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Hello Joshua, Installing Dotfiles..."

# Perform system installs and link dotfiles
source install/link.sh
source install/git.sh
source install/oh-my-zsh.sh

# Perform OSX specific installs
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\nPerforming OSX specific installs..."

    source install/brew.sh
    # source install/brew-cask.sh # This line should be uncommented

    # post brew installations
    source install/tpm.sh
    source install/base16-shell.sh
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

# Configure zsh as our default shell
if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

echo "Done. Reload your terminal."
