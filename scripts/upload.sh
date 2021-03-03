#!/usr/bin/env bash

set -e

version="$1"
remote="$2"

if [[ -z $version || -z $remote ]]; then
	echo "usage: $0 <version> <remote> "
	exit 1
fi

scp "$version/.bashrc" "$remote":.bashrc
scp "$version/sshd_config" "$remote":/tmp/sshd_config
ssh "$remote" "sudo -S cp /tmp/sshd_config /etc/ssh/sshd_config"

scp jetbrains/ros-jetbrains-ssh-auto.sh "$remote":ros-jetbrains-ssh-auto.sh
scp jetbrains/fake_python.sh "$remote":fake_python.sh
