# Run this from the project directory

ln -s $HOME/.ssh/config $PWD/ssh/config

echo "
FAN=bren0094
source $PWD/bash/csem_local.sh
source $PWD/bash/lock.sh
source $PWD/bash/open.sh
source $PWD/bash/pathtools.sh
source $PWD/bash/prompt.sh
" > $HOME/.bashrc