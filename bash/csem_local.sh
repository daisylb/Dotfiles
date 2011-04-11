# Installation:
#
# 1. Download this file.
# 2. Add the following to your .bash_profile:
#    FAN=bren0094 #replace with your FAN
#    source path/to/this/script/csem_local.sh
# 3. Restart Bash for the settings to take effect.
# 4. (optional) Set up passwordless login by running csem-passwordless-setup
#
# Usage:
#
# csem
#    Runs an interactive Bash shell on the CSEM server.
# csem-ssh
#    Connects to the CSEM SSH server.
# csem-x
#    Connects to the CSEM SSH server, using X.
# csem-put localfile [remotefile]
#    Puts localfile on your machine in the location specified by remotefile.
#    If remotefile is not specified, puts it in your home directory.
# csem-get remotefile [localfile]
#    Downloads remotefile to the location specified by localfile.
#    If localfile is not specified, puts it in the current working directory.
# csem-putfolder localfolder [remotefolder]
#    Puts localfolder on your machine in the location specified by remotefolder.
#    If remotefolder is not specified, puts it in your home directory.
# csem-get remotefolder [localfolder]
#    Downloads remotefolder to the location specified by localfolder.
#    If localfolder is not specified, puts it in the current working directory.
# csem-try task
#    Bundles up all the *.cpp and *.h files in the current directory, and
#    runs them through the `try` tool for the given task.
# csem-print file [printer]
#    Prints file to the given printer. Supports any files that lp supports,
#    including PDFs. If printer is not specified, defaults to 'min'.

alias csem-ssh="ssh -l $FAN lofty.csem.flinders.edu.au"
alias csem-x="ssh -X -l $FAN lofty.csem.flinders.edu.au"
alias csem="csem-ssh -t bash -i"
csem-put(){
	scp "$1" "$FAN@lofty.csem.flinders.edu.au:$2"
}
csem-get(){
	if [ "$2" ]
	then
		scp "$FAN@lofty.csem.flinders.edu.au:$1" "$2"
	else
		scp "$FAN@lofty.csem.flinders.edu.au:$1" .
	fi
}
csem-putfolder(){
	tar czf folder-put-temp.tgz "$1"
	csem-put folder-put-temp.tgz "$2"
	if [ "$2" ]
	then
		REMOTEFILE="$2/folder-put-temp.tgz"
	else
		REMOTEFILE="folder-put-temp.tgz"
	fi
	csem-ssh "tar xzf \"$REMOTEFILE\" && /usr/bin/rm \"$REMOTEFILE\"" 
	rm folder-put-temp.tgz
}
csem-getfolder(){
	csem-ssh "tar czf ~/folder-get-temp.tgz \"$1\""
	csem-get "~/folder-get-temp.tgz"
	tar xzf folder-get-temp.tgz $2
	rm folder-get-temp.tgz
	csem-ssh "/usr/bin/rm folder-get-temp.tgz"
}
csem-try(){
	zip remote-try-archive.zip *.cpp *.h
	csem-put remote-try-archive.zip
	csem-ssh "try $1 remote-try-archive.zip && /usr/bin/rm remote-try-archive.zip"
	rm remote-try-archive.zip
}
csem-print(){
	csem-put "$1" print.pdf
	if [ "$2" ]; then
		csem-ssh "lp -d $2 print.pdf"
	else
		csem-ssh "lp -d min print.pdf"
	fi
}
csem-passwordless-setup(){
	# this is untested :O
	if [ -f ~/.ssh/id_rsa.pub ]
	then
		echo "RSA key found."
	else
		echo "You don't appear to have a RSA key."
		echo "I'm about to run a program that will generate one,"
		echo "just use the default settings for everything."
		echo
		ssh-keygen -t rsa
	fi
	csem-put ~/.ssh/id_rsa.pub ~/id_rsa_temp.pub
	csem-ssh "if [ ! -d .ssh ]; then mkdir .ssh; fi; cat ~/id_rsa_temp.pub >> .ssh/authorized_keys; cat ~/id_rsa_temp.pub >> .ssh/authorized_keys2; chmod 700 .ssh; chmod 640 .ssh/authorized_keys2"
}