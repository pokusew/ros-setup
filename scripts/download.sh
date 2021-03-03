#!/usr/bin/env bash

set -e

version="$1"
remote="$2"

if [[ -z $version || -z $remote ]]; then
	echo "usage: $0 <version> <remote> "
	exit 1
fi

scp "$remote:.bashrc .bash_history cat /etc/ssh/sshd_config" "$version"
