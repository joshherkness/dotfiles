#!/usr/bin/env bash

log_message $(create_heading "Creating symlinks for dotfiles.")

# ======================================================
# These dotfiles should be linked
# ======================================================
linkables=$( find -H "$DOTFILES_DIR" -maxdepth 4 -name '*.symlink' )

for file in $linkables ; do
  target="$HOME/.$( basename $file '.symlink' )"
  if [ -e $target ]; then
    log_warning_message "Symlink for [~${target#$HOME}] already exists... Skipping."
  else
    # Check for broken symlinks
    log_success_message "Creating symlink for [$file]"
    ln -s $file $target
  fi
done

# ======================================================
# Create the ~/.config directory if needed
# ======================================================
if [ ! -d $HOME/.config ]; then
  log_message "Creating ~/.config"
  mkdir -p $HOME/.config
fi

# ======================================================
# Add symlinks for .config files
# ======================================================
for config in $DOTFILES_DIR/config/*; do
  target=$HOME/.config/$( basename $config )
  if [ -e $target ]; then
    log_warning_message "Symlink for [~${target#$HOME}] already exists, skipping."
  else
    log_success_message "Creating symlink for [$config]"
    ln -s $config $target
  fi
done
