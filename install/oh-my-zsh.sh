# Install oh-my-zsh
OH_MY_ZSH_DIR=$HOME/.oh-my-zsh
if ! [ -d $OH_MY_ZSH_DIR]; then
  echo -e "\nInstalling oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo -e "\nIt seems that oh-my-zsh is already installed"
fi

