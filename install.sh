#!/usr/bin/env bash

# Run this from the project directory

# SSH
ln -s $PWD/ssh/config $HOME/.ssh/config

# Git
ln -s $PWD/git/config $HOME/.gitconfig
ln -s $PWD/git/ignore $HOME/.gitignore_global

# set up fish config
echo "
. $PWD/fish/prompt.fish
. $PWD/fish/paths.fish
. $PWD/fish/aliases.fish
. ~/personal_projects/virtualfish/virtual.fish
set PATH $PWD/scripts/ /usr/local/bin \$PATH
" >> ~/.config/fish/config.fish
