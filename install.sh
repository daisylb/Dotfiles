#!/usr/bin/env bash
set -e

# Run this from the project directory

# SSH
ln -fs $PWD/ssh/config $HOME/.ssh/config

# Git
ln -fs $PWD/git/config $HOME/.gitconfig
ln -fs $PWD/git/ignore $HOME/.gitignore_global

# set up fish config
mkdir -p $HOME/.config/fish/
echo "
. $PWD/fish/prompt.fish
. $PWD/fish/paths.fish
. $PWD/fish/aliases.fish
. ~/personal_projects/virtualfish/virtual.fish
set PATH $PWD/scripts/ /usr/local/bin \$PATH
" >> $HOME/.config/fish/config.fish

# TODO: install homebrew, update git

# install fish, and make it the default
if test ! -f /usr/local/bin/fish; then
	brew install autoconf || true
	mkdir temp
	cd temp
	curl -o fish.tgz https://nodeload.github.com/fish-shell/fish-shell/zip/master
	tar xzf fish.tgz
	cd fish-shell-master
	autoconf
	./configure --without-xsel
	make
	sudo make install
	cd ../..
	rm -rf temp
fi
# todo: set default shell

# install chocolat
if test ! -d /Applications/Chocolat.app/; then
	mkdir temp
	cd temp
	curl -o choc.zip http://files.fileability.net/Chocolat_1.4.3.zip
	unzip choc.zip
	mv Chocolat.app /Applications/
	cd ..
	rm -rf temp
fi

# install source code pro
if test ! -f ~/Library/Fonts/SourceCodePro-Regular.otf; then
	mkdir temp
	cd temp
	curl -o scp.zip http://cloud.github.com/downloads/adobe/source-code-pro/SourceCodePro_FontsOnly-1.013.zip
	unzip scp.zip
	mv SourceCodePro_FontsOnly-1.013/OTF/*.otf ~/Library/Fonts/
	cd ..
	rm -rf temp
fi
