# Install the base 16 color scheme within the shell
BASE16_DIR=$HOME/.config/base16-shell
if ! [ -d $BASE16_DIR ]; then
  echo -e "\nInstalling base 16 theme"
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
else
  echo -e "\nIt seems that base 16 is already installed."
fi
