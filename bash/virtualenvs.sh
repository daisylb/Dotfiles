#VIRTUALENV MANAGER

# Installation:
# 1. Add the following lines to your .bash_profile:
#      PYENV_PATH="/Users/adam/.virtualenvs"
#      PYENV_CUSTOM_PROMPT=1
#      source path/to/this/script/virtualenvs.sh
# 2. Make sure PYENV_PATH exists. It must be absolute, you can't use ~.
# 2. Set PYENV_CUSTOM_PROMPT to 0 if you don't use a custom Bash prompt (PS1).
# 3. If you have a custom prompt, set PROMPT_BEFORE_VE to the part of the
#    prompt that appears before the virtualenv's name, and PROMPT_AFTER_VE
#    to the part that appears after.

# Usage:
#
# pyenv [environment-name]
#    Switches to the environment called `environment-name`.
# create-pyenv environment-name [python-binary] [path/to/requirements.txt]

if [ $PYENV_CUSTOM_PROMPT != 0 ]; then
	PS1="$PROMPT_BEFORE_VE $PROMPT_AFTER_VE"
	VIRTUAL_ENV_DISABLE_PROMPT=1
fi

PYENV_ENABLED=0

pyenv(){
	if [ "$1" ]; then
		if [ $PYENV_ENABLED != 0 ]; then
			deactivate
		fi
		source "$PYENV_PATH/$1/bin/activate"
		if [ $PYENV_CUSTOM_PROMPT != 0 ]; then
			PS1="$PROMPT_BEFORE_VE pyenv:$1 $PROMPT_AFTER_VE"
		fi
		PYENV_ENABLED="$1"
		
		#perform check
		if [-f "$PYENV_PATH/$PYENV_ENABLED.sha1sum" ]; then
			sha1sum -c "$PYENV_PATH/$PYENV_ENABLED.sha1sum" > /dev/null 2&>1
			if [ $? == 1 ]; then
				pip install -r `cat "$PYENV_PATH/$PYENV_ENABLED.path"`
			fi
		fi
	else
		deactivate
		if [ $PYENV_CUSTOM_PROMPT != 0 ]; then
			PS1="$PROMPT_BEFORE_VE $PROMPT_AFTER_VE"
		fi
		PYENV_ENABLED=0
	fi
}

create-pyenv(){
	if [ -z "$1" ]; then
		echo "Usage: create-pyenv environment-name [python-binary] [path/to/requirements.txt]"
	else
		if [ $PYENV_ENABLED != 0 ]; then
			pyenv #deactivate
		fi
		if [ "$2" ]; then
			virtualenv -p "$2" --no-site-packages "$PYENV_PATH/$1"
		else
			virtualenv --no-site-packages "$PYENV_PATH/$1"
		fi
		pyenv "$1"
		if [ "$3" ]; then
			edit-pyenv add-reqs "$3"
		fi
	fi
}

edit-pyenv(){
	if [ "$1" == "add-reqs" ]; then
		if [ -z "$2" ]; then
			echo "Usage: edit-pyenv add-reqs path/to/requirements.txt"
		else
			if [ $PYENV_ENABLED != 0 ]; then
				pip install -r "$2"
				echo `pwd -P`/"$2" > "$PYENV_PATH/$PYENV_ENABLED.path"
				sha1sum `pwd -P`/"$2" > "$PYENV_PATH/$PYENV_ENABLED.sha1sum"
			else
				echo "No virtualenv is enabled."
			fi
		fi
	else
		echo "Usage:"
		echo " - edit-pyenv add-reqs path/to/requirements.txt"
	fi
}