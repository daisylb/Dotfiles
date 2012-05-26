o(){
	if [ "$1" == "" ]; then
		xdg-open . &> /dev/null
	else
		xdg-open "$1" &> /dev/null
	fi
}

e(){
	nohup sublime_text $1 >/dev/null 2>&1 &
}

g(){
	nohup $* >/dev/null 2>&1 &
}

sp(){
	g sublime_text --project $1
}

sp-new(){
	echo "{\"folders\":[{\"path\":\"`pwd`\"}]}" > $1.sublime-project
}

GITG_PATH=`which gitg`
alias gitg='g $GITG_PATH'

alias clean-gedit-tempfiles='find . -name "*~" | xargs rm'
