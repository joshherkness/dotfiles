#!/usr/bin/env bash

# ======================================================
# Define a few color properties for our output using tput.
# ======================================================
RED=`tput setaf 1` # Error
GREEN=`tput setaf 2` #Success
YELLOW=`tput setaf 3` # Warning
BLUE=`tput setaf 4` # Info
RESET=`tput sgr0`

# ======================================================
# This function tests whether a command exists.
# ======================================================
function command_exists() {
  type "$1" > /dev/null 2>&1
}

# ======================================================
# This function tests whether a brew formula is installed.
# ======================================================
function formula_installed() {
  brew list -1 | grep -q $1
}

# ======================================================
# This function tests whether a brew cask has been installed.
# ======================================================
function cask_installed() {
  brew cask list | grep -q $1
}

# ======================================================
# General logging functions
# ======================================================
function create_heading() {
  WRAPPER="======================================================"
  echo "\n${WRAPPER}\n$@\n${WRAPPER}"
}

function log_message() {
  echo -e "${BLUE}$@${RESET}"
}

function log_error_message() {
  echo -e "${RED}$@${RESET}"
}

function log_warning_message() {
  echo -e "${YELLOW}$@${RESET}"
}

function log_success_message() {
  echo -e "${GREEN}$@${RESET}"
}
