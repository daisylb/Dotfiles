# Run this from the project directory

# SSH
ln -s $PWD/ssh/config $HOME/.ssh/config

# Git
ln -s $PWD/git/config $HOME/.gitconfig
ln -s $PWD/git/ignore $HOME/.gitignore_global

# set up bash profile
echo "###
FAN=bren0094
source $PWD/bash/csem_local.sh
source $PWD/bash/lock.sh
source $PWD/bash/open.sh
source $PWD/bash/pathtools.sh
source $PWD/bash/prompt.sh
source `which virtualenvwrapper.sh`
" >> $HOME/.bash_profile

# set up virtualenv
source `which virtualenvwrapper.sh`
echo 'set-special-ps1 "virtualenv:`echo $VIRTUAL_ENV | sed "s|$WORKON_HOME/||"`"' >> $HOME/.virtualenvs/postactivate