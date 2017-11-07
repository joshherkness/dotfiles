# This function prepends to the path variable
function prepend-path() {
  [ -d $1 ] && PATH="$1:$PATH"
}

function is-executable() {
  type "$1" > /dev/null 2>&1 || return 1;
}

# Start with system path
# Retrieve it from getconf, otherwise it's just current $PATH

is-executable getconf && PATH=$(`command -v getconf` PATH)

# Prepend path items
prepend-path "/bin"
prepend-path "/usr/bin"
prepend-path "/usr/local/bin"
prepend-path "$DOTFILES_BREW_PREFIX_COREUTILS/libexec/gnubin"
prepend-path "$DOTFILES_DIR/bin"
prepend-path "$HOME/bin"
prepend-path "/sbin"
prepend-path "/usr/sbin"
prepend-path "/usr/local/sbin"
prepend-path "$HOME/.rvm/bin"
prepend-path "$HOME/.npm-packages/bin"
prepend-path "/Library/TeX/texbin/"

# Remove duplicates (preserving prepended items)
# Source: http://unix.stackexchange.com/a/40755
PATH=`echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

# Export the PATH variable
export PATH
