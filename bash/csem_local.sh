# Macros for Flinders University School of Computer Science, Engineering and Mathematics
# See csem_local.markdown for documentation

alias csem-x="ssh -X csem"
alias csem="ssh csem -t bash -i"

csem-try(){
	zip remote-try-archive.zip *.cpp *.h
	csem-put remote-try-archive.zip
	csem-ssh "try $1 remote-try-archive.zip && /usr/bin/rm remote-try-archive.zip"
	rm remote-try-archive.zip
}

# WARNING: Doesn't play nice with UniCard
# Uncomment and use at your own risk

#csem-print(){
#	csem-put "$1" print.pdf
#	if [ "$2" ]; then
#		csem-ssh "lp -d $2 print.pdf"
#	else
#		csem-ssh "lp -d min print.pdf"
#	fi
#}