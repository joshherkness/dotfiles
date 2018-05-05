#!/usr/bin/env bash

# ======================================================
# Install TMP (TMUX Package Manager)
# ======================================================
TMUX_DIR=$HOME/.tmux
TPM_DIR=$TMUX_DIR/plugins/tpm
TPM_URL="https://github.com/tmux-plugins/tpm"
log_message $(create_heading "TPM (TMUX Package Manager)")

# Ensure the TMUX is installed
if [ -d $TMUX_DIR ]; then
  if ! [ -d $TPM_PATH]; then
    log_message "Installing TPM at [$TPM_DIR]"
    git clone $TPM_URL $TPM_DIR
  else
    log_warning_message "TPM is already installed, skipping."
  fi
else
  log_error_message "TMUX not found. Please install and then re-run installation scripts."
fi
