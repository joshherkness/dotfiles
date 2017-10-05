#!/bin/sh

# Function tests whether a Homebrew formula is installed
function formula_installed() {
  brew list -1 | grep -q $1
}

# Check to ensure Homebrew isn't already installed
if test ! $(which brew); then
  echo "Installing Homebrew"

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Ensure that Homebrew was installed successfully
if test ! $(which brew); then
  echo >&2 "Cannot find the 'brew' command."
fi

# Install Homebrew formulas
formulas=(
  diff-so-fancy
  fzf
  git
  heroku
  heroku-toolbelt
  mongodb
  mysql
  neovim
  node
  openssl
  pandoc
  python3
  rbenv
  ruby-build
  watchman
  z
  zsh
  zplug
)

for formula in ${formulas[@]}; do
  if ! formula_installed $formula; then
    brew install $formula
  else
    echo "$formula has already been installed... skipping."
  fi
done
