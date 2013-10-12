#alias fixlyrics 'pbpaste | tr "[:upper:]" "[:lower:]" | perl -pe "s/^(.)/\U\1/g" | perl -pe "s/\bi(['\s])/I\1/g" | pbcopy'

#function subp

alias tcdeploy 'curl -u tomcat:tomcat "http://localhost:8080/manager/text/deploy?path=/"(basename $PWD)"&war=file:"(echo $PWD | tr " " "%20")'
#alias tcundeploy 'curl -u tomcat:tomcat "http://localhost:8080/manager/text/deploy?path=/"(basename $PWD)'
#alias tcredeploy 'tcundeploy; tcdeploy'

function tcdeploydir
	set url "http://localhost:8080/manager/text/deploy?path=/"(basename $PWD)"&war=file:"(echo $PWD | sed "s| |\%20|g")
	echo $url
	curl -u tomcat:tomcat $url
end

function tcundeploy
	set url "http://localhost:8080/manager/text/undeploy?path=/"(basename $PWD)
	echo $url
	curl -u tomcat:tomcat $url
end

function tcredeploy
	tcundeploy
	tcdeploy
end

function tclink
	ln -s (pwd) /usr/local/Cellar/tomcat/7.0.30/libexec/webapps/(basename (pwd))
end

function tcunlink
	set link /usr/local/Cellar/tomcat/7.0.30/libexec/webapps/(basename (pwd))
	if test -L $link
		unlink $link
	end
end

function tcreload
	set url "http://localhost:8080/manager/text/reload?path=/"(basename $PWD)
	echo $url
	curl -u tomcat:tomcat $url
end

function ssh-copy-id
	switch (count $argv)
		case 1
			set server $argv[1]
			set port 22
			set keyfile ~/.ssh/id_rsa.pub
		case 2
			set server $argv[1]
			if test -z (echo $argv[2] | tr -d "[0-9]")
				# second arg is a number
				set port $argv[2]
				set keyfile ~/.ssh/id_rsa.pub
			else
				set port 22
				set keyfile $argv[2]
			end
		case 3
			set server $argv[1]
			set port $argv[2]
			set keyfile $argv[3]
		case '*'
			echo 'Error: please supply at least one argument'
			echo 'Usage: ssh-copy-id <server> [<port>] [<pubkeyfile>]'
			return 1
	end
	if test ! -f $keyfile
		echo "Keyfile $keyfile doesn't exist."
		return 1
	end
	set cmd "sh -c 'mkdir -p .ssh; key=\""(cat $keyfile)"\"; echo \$key >> .ssh/authorized_keys; echo \$key >> .ssh/authorized_keys2; chmod 700 .ssh/; chmod 600 .ssh/authorized_keys .ssh/authorized_keys2'"
	ssh $server -p $port $cmd 
end

function mde
	open -a Byword $argv[1]
	open -a Marked $argv[1]
end

alias serve 'twistd -n web --path .'

function gitg
	set toplevel (git rev-parse --show-toplevel)
	if test $status = 0
		open -a SourceTree $toplevel
	else
		echo "Not a Git repository."
	end
end

function fixpb --description "Fix pasteboard contents from Office:mac and other sources"
	pbpaste | tr '\r\n' '\n' | tr '\r' '\n' | tr '•' '-' | tr '“' '"' | tr '”' '"' | tr '​' '\t' | pbcopy
end

function dj-superuser-details
	echo "from django.contrib.auth.models import User; u = User.objects.all()[0]; print 'Username:', u.username; u.set_password('password'); u.save()" | python manage.py shell
	echo "Password: password"
end

function igf
    pushd (git rev-parse --show-toplevel)
    mvim "+:set fullscreen"
end

function ig
    pushd (git rev-parse --show-toplevel)
    mvim
    popd
end

function i
    pushd (git rev-parse --show-toplevel)
    mvim
    popd
end
