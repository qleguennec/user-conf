source ./env.sh

# Git configuration
git config push.default simple
git config user.name "$UNAME"
git config user.mail "$UMAIL"

# Directories
mkdir -p $HOME/wp
mkdir -p $HOME/img
mkdir -p $HOME/dwl
mkdir -p $HOME/.bin

# Fonts
echo "Installing inconsolata"
mkdir /tmp/inconsolata
cd /tmp/inconsolata
curl -O http://www.fantascienza.net/leonardo/ar/inconsolatag/inconsolata-g_font.zip
unzip *.zip
mkdir -p $HOME/.local/share/fonts
cp Inconsolata-g.* $HOME/.local/share/fonts
fc-cache

# Terminal
cd $HOME/wp
git clone "$GITADDR/st.git"
cd st
make
cp st $HOME/.bin
make clean
