#!/usr/bin/env bash

# ======================================================
# Install oh-my-zsh
# ======================================================
log_message $(create_heading "Installing oh-my-zsh.")

OH_MY_ZSH_DIR=$HOME/.oh-my-zsh
if ! [ -d "$OH_MY_ZSH_DIR" ]; then
  log_message "oh-my-zsh not found, installing now..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  log_warning_message "Oh-my-zsh is already installed, skipping."
fi

