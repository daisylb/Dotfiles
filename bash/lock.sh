unlock(){
	mkdir -p ~/$1
	encfs ~/.$1 ~/$1
	cd ~/$1
	source init.sh
}
lock(){
	_lock_$1
	cd ~
	fusermount -u ~/$1
	retcode=$?
	if [ $retcode == 0 ] ; then
		rmdir ~/$1
		exit
	else
		echo "Could not unmount the directory."
	fi
}
