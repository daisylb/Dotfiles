set fish_greeting # turn off greeting
functions -e open # turn off Fish's open command, it's not necessary on OS X

function prompt_pwd --description 'Print the current working directory, shortened to fit the prompt'
		switch "$PWD"
				case "$HOME"
					echo '~'
				case '*'
					printf "%s" (echo $PWD|perl -pe "s|^$HOME|~|i" | sed -e 's-\(\.\{0,1\}[^/]\{5\}\)\([^/][^/]*\)/-\1…/-g')
		end
end

function fish_prompt --description 'Write out the prompt'
	# Empty line
	echo " "
	
	# Path
	echo -s (set_color -o cyan) (prompt_pwd)

	# Git line
	set __prompt_git_branch (git name-rev HEAD ^/dev/null | awk "{ print \$2 }")
	if [ "$__prompt_git_branch" != '' ]
		echo -n -s (set_color yellow) $__prompt_git_branch
		set __prompt_git_staged (git status --porcelain | sed -E 's/^([^?[:space:]])?.*/\1/g' | tr -d '\n')
		set __prompt_git_unstaged (git status --porcelain | sed -E 's/^.([^[:space:]])?.*/\1/g' | tr -d '\n')
		if [ "$__prompt_git_staged$__prompt_git_unstaged" != '' ]
			echo -s (set_color red) ' ' "$__prompt_git_unstaged:$__prompt_git_staged"
		else
			echo -s (set_color green) ' ' 'clean'
		end
	end

	# Virtualenv line
	if set -q VIRTUAL_ENV
		echo -s (set_color yellow) "virtualenv: " (basename "$VIRTUAL_ENV")
	end

	# Prompt
	switch $USER
		case root
			echo -n -s (set_color -b red) (set_color -o white) "root #" (set_color normal) ' '
		case '*'
			echo -n -s (set_color -o green) "\$" ' ' (set_color normal)
	end
end
