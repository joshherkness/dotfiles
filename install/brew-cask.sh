#!/bin/sh

# Function tests whether a Homebrew formula is installed
function formula_installed() {
  brew list -1 | grep -q $1
}

# Function tests whether a Homebrew cask has been installed
function cask_installed() {
  brew cask list | grep -q $1
}

# Allow the use of Homebrew Casks:
# https://github.com/phinze/homebrew-cask
brew tap phinze/cask > /dev/null 2>&1
formula_installed brew-cask || brew install brew-cask

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# These are the casks that will be installed
casks=(
  discord
  dropbox
  google-chrome
  intellij-idea-ce
  iterm2
  numi
  1password
  slack
  spotify
  visual-studio-code
)

for cask in ${casks[@]}; do
  if ! cask_installed $cask; then
    brew cask install $cask
  else
    echo "$cask has already been installed... skipping"
  fi
done
