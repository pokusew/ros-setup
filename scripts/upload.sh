#!/usr/bin/env bash

set -e

version="$1"
remote="$2"

if [[ -z $version || -z $remote ]]; then
	echo "usage: $0 <version> <remote> "
	exit 1
fi

scp "$version/.bashrc" "$remote":.bashrc

scp jetbrains/ros-jetbrains-ssh-auto.sh "$remote":ros-jetbrains-ssh-auto.sh
scp jetbrains/fake_python.sh "$remote":fake_python.sh
