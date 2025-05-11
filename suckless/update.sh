#!/usr/bin/bash

pushd $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for p in dmenu dwm st; do
	echo "Updating $p..."
	cp config_$p.h $p/config.h
done

popd
