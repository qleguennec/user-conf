source ./env.sh

# Git configuration
git config push.default simple
git config user.name "$NAME"
git config user.mail "$MAIL"

# Directories
mkdir -p $HOME/wp
mkdir -p $HOME/img
mkdir -p $HOME/dwl
