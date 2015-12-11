source $HOME/.user/env.sh

# Git configuration
git config --global push.default simple
git config --global user.name "$UNAME"
git config --global user.mail "$UMAIL"

# Directories
mkdir -p $HOME/wp
mkdir -p $HOME/img
mkdir -p $HOME/dwl
mkdir -p $HOME/.bin

# Fonts
function fonts {
	echo "Installing inconsolata"
	mkdir /tmp/inconsolata
	cd /tmp/inconsolata
	curl -O http://www.fantascienza.net/leonardo/ar/inconsolatag/inconsolata-g_font.zip
	unzip *.zip
	mkdir -p $HOME/.local/share/fonts
	cp Inconsolata-g.* $HOME/.local/share/fonts
	fc-cache
}

# Terminal
function term {
	"Installing st"
	cd $HOME/wp
	git clone "$GITADDR/st.git"
	cd st
	make
	cp st $HOME/.bin
	make clean
}

# Zsh
function shell {
	echo "Installing zsh"
	if command -v zsh > /dev/null 2>&1; then
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		curl -O /tmp/zshrc.patch https://gist.github.com/1c003a043b5c17e94178
		cd $HOME
		patch -p1 .zshrc < /tmp/zshrc.patch
	else
		echo "zsh is not installed, aborting shell setup"
	fi
}

case $1 in
"fonts")
	fonts
	;;
"term")
	term
	;;
"shell")
	shell
	;;
"")
	fonts
	term
	shell
	;;
*)
	echo "option $1 is unknown"
	;;
esac
