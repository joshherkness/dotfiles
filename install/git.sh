#!/bin/sh

echo "Setting up git"

if [[ ! -e ~/.gitconfig ]]; then
	echo "\n"
	echo "Fetching a base .gitconfig file"

	# A sensible default git config, minus personal data
	curl https://raw.githubusercontent.com/robmiller/dotfiles/master/gitconfig | tail -n+4 >> ~/.gitconfig
fi

if ! grep -q email ~/.gitconfig; then
	echo "\n"
	echo "Configuring personal information for Git"

	# Prompt the user for their personal information, to use in the
	# .gitconfig file
	fullname=
	email=
	vared -p "What's your full name? " fullname
	vared -p "What's your email address? " email

	echo "Setting git config to use $fullname <$email>."
	git config --global user.name "$fullname"
	git config --global user.email "$email"
fi
