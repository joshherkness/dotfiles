# Install tpm (tmux package manager)
TMUX_DIR=$HOME/.tmux
if ! [ -d $TMUX_DIR ]; then
  echo -e "\nInstalling tpm at $TMUX_DIR"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tmux not found. Please install and then re-run installation scripts"
fi
