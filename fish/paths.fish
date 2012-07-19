function addpath
	switch $argv[1]
		case 'mamp'
			set -gx PATH /Applications/MAMP/Library/bin/ /Applications/MAMP/bin/php/php5.3.6/bin $PATH
		case "android"
			set -gx PATH /usr/local/Cellar/android-sdk/r18/tools /usr/local/Cellar/android-sdk/r18/platform-tools $PATH
		case "postgres"
			set -gx PATH /Applications/Postgres.app/Contents/MacOS/bin $PATH
		case '*'
			echo "addpath: I don't know where to find $argv[1]"
			return 1
	end
end