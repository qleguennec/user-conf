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

if [ ! -f "$HOME/.bin/user-install" ]; then
	ln -s $HOME/.user/install.sh $HOME/.bin/user-install
	chmod +x $HOME/.bin/user-install
fi

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
	echo "Installing st"
	cd $HOME/wp
	if [ ! -d "st" ]; then
		git clone "$GITADDR/st.git" st
	fi
	cd st
	make
	cp st $HOME/.bin
	make -C $HOME/wp/st clean
}

# Zsh
function shell {
	if command -v zsh > /dev/null 2>&1; then
		echo "Installing zsh"
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		curl https://gist.githubusercontent.com/qleguennec/3ba24ff659da8ba821f5/raw/zshrc > $HOME/.zshrc
	else
		echo "zsh is not installed, aborting shell setup"
	fi
}

# Openbox
function openbox {
	if command -v openbox > /dev/null 2>&1; then
		mkdir -p .config/
		cd .config
		git clone "$GITADDR/openbox-conf.git" openbox
	else
		echo "openbox not installed, aborting openbox setup"
	fi
}

# Vim
function vim {
	ln -sf $HOME/.user/.vimrc $HOME/.vimrc
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
"openbox")
	openbox
	;;
"vim")
	vim
	;;
"")
	fonts
	term
	openbox
	shell
	vim
	;;
*)
	echo "option $1 is unknown"
	;;
esac
