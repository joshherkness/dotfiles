#!/usr/bin/env bash

log_message $(create_heading "Homebrew")

FORMULAS=(
  diff-so-fancy
  fzf
  git
  mongodb
  mysql
  neovim
  node
  openssl
  pandoc
  rbenv
  python
  ruby-build
  watchman
  z
  zsh
  zplug
)

# ======================================================
# Check for Homebrew installation and install if necessary.
# ======================================================
if test ! $(which brew); then
  log_message "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  log_warning_message "Homebrew is already installed, skipping."
fi

# ======================================================
# This function is used to install brew formula.
# ======================================================
function install_brew_formula() {
  for FORMULA in ${FORMULAS[@]}; do
    if ! formula_installed $FORMULA; then
      brew install $FORMULA
    else
      log_warning_message "[$FORMULA] is already installed, skipping."
    fi
  done
}

# ======================================================
# Test that brew was installed successfully in order to install formula.
# ======================================================
log_message $(create_heading "Homebrew formula")
if test ! $(which brew); then
  log_error_message "Cannot find the 'brew' command. Please install manually."
else
  install_brew_formula
fi

