#!/usr/bin/env bash

set -e

version="$1"
remote="$2"
options="$3"

if [[ -z $version || -z $remote ]]; then
	echo "usage: $0 <version> <remote> "
	exit 1
fi

echo "... uploading $version/.bashrc"
scp "$version/.bashrc" "$remote":.bashrc
if [[ $options == "--all" ]]; then
	echo "uploading $version/sshd_config to /etc/ssh/sshd_config"
	scp "$version/sshd_config" "$remote":/tmp/sshd_config
	ssh "$remote" "sudo -S cp /tmp/sshd_config /etc/ssh/sshd_config"
fi
if [[ -r "$version/.tmux.conf" ]]; then
	echo "... uploading $version/.tmux.conf"
	scp "$version/.tmux.conf" "$remote":.tmux.conf
fi

echo "... uploading jetbrains/ros-jetbrains-ssh-auto.sh"
scp jetbrains/ros-jetbrains-ssh-auto.sh "$remote":ros-jetbrains-ssh-auto.sh
echo "... uploading jetbrains/fake_python.sh"
scp jetbrains/fake_python.sh "$remote":fake_python.sh

echo "... uploading vscode/create-dot-env.sh"
ssh "$remote" "mkdir -p bin"
scp vscode/create-dot-env.sh "$remote":bin/create-dot-env.sh
