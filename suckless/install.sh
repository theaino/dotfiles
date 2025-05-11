#!/usr/bin/bash

pushd $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

./update.sh

for p in dmenu dwm st; do
	pushd $p
		sudo make clean install
	popd
done

popd
