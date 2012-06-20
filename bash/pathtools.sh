path(){
	_OLD_PATHTOOLS_PATH=$PATH
	PATH="`do-path-lookup $1`:$PATH"
	set-special-ps1 "path:$1"
}

rmpath(){
	PATH=$_OLD_PATHTOOLS_PATH
	set-normal-ps1
}

do-path-lookup(){
	case "$1" in
		"android")
			echo "/usr/local/Cellar/android-sdk/r18/tools:/usr/local/Cellar/android-sdk/r18/platform-tools" ;;
		"postgres")
			echo "/Applications/Postgres.app/Contents/MacOS/bin" ;;
		"mamp")
			echo "/Applications/MAMP/Library/bin" ;;
	esac
}