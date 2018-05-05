#!/bin/sh

log_message $(create_heading "Setting up git.")

# ======================================================
# Fetch sensible git config defaults.
# ======================================================
if [[ ! -e ~/.gitconfig ]]; then
  log_message "Fetching sensible git config defaults"

	# A sensible default git config, minus personal data
	curl https://raw.githubusercontent.com/robmiller/dotfiles/master/gitconfig | tail -n+4 >> ~/.gitconfig
else
  log_warning_message "File [~/.gitconfig] already exists. If you would like
  this to be updated, please do so manually."
fi

if ! grep -q email ~/.gitconfig; then
  log_message "Configuring personal information for git."

	# Prompt the user for their personal information, to use in the
	# .gitconfig file
	fullname=
	email=
	vared -p "What's your full name? " fullname
	vared -p "What's your email address? " email

	log_success_message "Setting git config to use $fullname <$email>."
	git config --global user.name "$fullname"
	git config --global user.email "$email"
else
  log_warning_message "Personal information is already configured for git."
fi
