#!/usr/bin/env bash
set -e
git clone --depth=1 git://github.com/alloy/macvim.git ~/macvim-tmp
cd ~/macvim-tmp/src/MacVim/icons
# make getenvy
# make all
cd ../..
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope
make
cp -r MacVim/build/Release/MacVim.app /Applications/
cd
rm -rf ~/macvim-tmp