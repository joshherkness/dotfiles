#!/usr/bin/env bash

log_message $(create_heading "Casks")

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# These are the casks that will be installed
apps=(
  discord
  dropbox
  google-chrome
  iterm2
  numi
  1password
  slack
  spotify
  visual-studio-code
)

# ======================================================
# Install Homebrew casks
# ======================================================
log_message "Installing Homebrew casks"
for app in ${apps[@]}; do
  if ! cask_installed $app; then
    brew cask install $app
  else
    log_warning_message "[$app] has already been installed, skipping"
  fi
done
