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
			echo "/opt/android/tools:/opt/android/platform-tools" ;;
	esac
}