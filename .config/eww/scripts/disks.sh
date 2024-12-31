#!/bin/bash

if [[ $1 == "list" ]] ; then
	for disk in $(ls /media/$USER/) ; do
		echo $disk
	done
elif [[ $1 == "count" ]] ; then
	count=$(ls /media/$USER | wc -l)
	echo "$count"
fi
