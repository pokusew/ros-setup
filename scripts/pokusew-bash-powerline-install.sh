#!/usr/bin/env bash

set -e

remote="$1"

if [[ -z $remote ]]; then
	echo "usage: $0 <remote> "
	exit 1
fi

scp /Users/pokusew/Sites/pokusew-macos-setup/src/bash-powerline.sh "$remote":pokusew-bash-powerline.sh
