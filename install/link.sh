#!/usr/bin/env bash

echo "Creating symlinks"

# These dotfiles should be linked
linkables=$( find -H "$DOTFILES_DIR" -maxdepth 4 -name '*.symlink' )

for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo "installing to ~/.config"

# Create the ~/.config directory if needed
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

# Add symlinks for .config files
for config in $DOTFILES_DIR/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done
