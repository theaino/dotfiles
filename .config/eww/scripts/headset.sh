#!/bin/bash

if ! (headsetcontrol --connected > /dev/null) ; then
	echo "H NC"
	exit
fi

echo "H $(headsetcontrol -b -o JSON | jq '.devices.[0].battery.level')%"
