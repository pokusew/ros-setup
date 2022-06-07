#!/usr/bin/env bash

set -e

version="$1"
remote="$2"

if [[ -z $version || -z $remote ]]; then
	echo "usage: $0 <version> <remote> "
	exit 1
fi

scp "$remote:.bashrc .bash_history .profile .gitconfig .nanorc /etc/ssh/sshd_config .config/htop/htoprc .vnc/xstartup" "$version"
scp "$remote:.ssh/config" "$version/ssh_config"
