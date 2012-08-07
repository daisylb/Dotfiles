#alias fixlyrics 'pbpaste | tr "[:upper:]" "[:lower:]" | perl -pe "s/^(.)/\U\1/g" | perl -pe "s/\bi(['\s])/I\1/g" | pbcopy'

#function subp

alias tcdeploy 'curl -u tomcat:tomcat "http://localhost:8080/manager/text/deploy?path=/"(basename $PWD)"&war=file:$PWD"'
alias tcundeploy 'curl -u tomcat:tomcat "http://localhost:8080/manager/text/deploy?path=/"(basename $PWD)'
alias tcredeploy 'tcundeploy; tcdeploy'

function ssh-copy-id
	switch (count $argv)
		case 1
			set server $argv[1]
			set keyfile ~/.ssh/id_rsa.pub
		case 2
			set server $argv[1]
			set keyfile $argv[2]
		case '*'
			echo 'Error: please supply at least one argument'
			echo 'Usage: ssh-copy-id <server> [<pubkeyfile>]'
			return 1
	end
	ssh $server "bash -c 'mkdir -p .ssh; key=\""(cat $keyfile)"\"; echo \$key >> .ssh/authorized_keys; echo \$key >> .ssh/authorized_keys2; chmod 0600 .ssh/authorized_keys .ssh/authorized_keys2'"
end

function mde
	open -a Byword $argv[1]
	open -a Marked $argv[1]
end

alias gitg 'open -a SourceTree .'
