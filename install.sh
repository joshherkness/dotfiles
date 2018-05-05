#!/usr/bin/env bash

# Include general dotfile utisl
source utils.sh

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

log_success_message $(create_heading "Hello Joshua, \n\nWelcome to your
dotfiles installation. ")

# ======================================================
# Prompt to user to begin install.
# ======================================================
read -p "Are you sure you would like to begin the install (y/Y)? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo ""
else
  log_message $(create_heading "Goodbye, Joshua!")
  exit
fi

# ======================================================
# Perform system installs and linking.
# ======================================================
source install/link.sh
source install/git.sh
source install/oh-my-zsh.sh

# ======================================================
# Perform OSX specific installs
# ======================================================
if [ "$(uname)" == "Darwin" ]; then
    source install/brew.sh
    source install/brew-cask.sh

    # post brew installations
    source install/tpm.sh
    source install/base16-shell.sh
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

# ======================================================
# Configure zsh as our default shell
# ======================================================
if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

log_success_message $(create_heading "Installation is complete, please reload your terminal.")
