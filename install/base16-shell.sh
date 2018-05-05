#!/usr/bin/env bash

# ======================================================
# Install the base 16 color scheme
# ======================================================
BASE16_DIR=$HOME/.config/base16-shell
BASE16_URL="https://github.com/chriskempson/base16-shell.git"
log_message $(create_heading "Base 16")
if ! [ -d $BASE16_DIR ]; then
  log_message "Installing base 16 theme..."

  # Clone the base 16 repository.
  git clone $BASE16_URL $BASE16_DIR
else
  log_warning_message "Base 16 is already installed, skipping."
fi
