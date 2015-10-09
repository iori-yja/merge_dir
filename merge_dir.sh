#!/bin/zsh


dstdir="100RICOH"
srcdir="101RICOH"


# checking for filename duplication
function check_for_duplication() {
	dupflag=0
	pushd ${dstdir}
	for i in *
		if [[ -a ../${srcdir}/$i ]]; then
			echo "duplication found:" $i
			dupflag=1
		fi

	if [ dupflag ]; then
		exit 1
	fi
	popd
}

# move all file in source dir
function move_all() {
	mv ${srcdir}/* ${dstdir}
	rmdir ${srcdir}
}

# main
check_for_duplication
move_all

