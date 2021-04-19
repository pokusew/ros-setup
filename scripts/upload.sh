#!/usr/bin/env bash

# TODO: refactor

set -e

version="$1"
remote="$2"
options="$3"

if [[ -z $version || -z $remote ]]; then
	echo "usage: $0 <version> <remote> "
	exit 1
fi

if [[ -z $POKUSEW_BASH_POWERLINE_SRC ]]; then
	POKUSEW_BASH_POWERLINE_SRC="/Users/pokusew/Sites/pokusew-macos-setup/src/pokusew-bash-powerline.sh"
fi

if [[ -z $RH_SRC ]]; then
	RH_SRC="/Users/pokusew/Sites/ros/rh/rh.sh"
fi

echo "using the following paths (use env variables to change them):"
echo "  POKUSEW_BASH_POWERLINE_SRC = $POKUSEW_BASH_POWERLINE_SRC"
echo "  RH_SRC = $RH_SRC"

echo "... uploading pokusew-bash-powerline.sh (source: $POKUSEW_BASH_POWERLINE_SRC)"
scp "$POKUSEW_BASH_POWERLINE_SRC" "$remote":pokusew-bash-powerline.sh

echo "... uploading rh.sh (source: $RH_SRC)"
scp "$RH_SRC" "$remote":rh.sh

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
if [[ -r "$version/.gitconfig" ]]; then
	echo "... uploading $version/.gitconfig"
	scp "$version/.gitconfig" "$remote":.gitconfig
fi
if [[ -r "$version/.nanorc" ]]; then
	echo "... uploading $version/.nanorc"
	scp "$version/.nanorc" "$remote":.nanorc
fi
if [[ -r "$version/ssh_config" ]]; then
	echo "... uploading $version/ssh_config to ~/.ssh/config"
	scp "$version/ssh_config" "$remote":.ssh/config
fi
if [[ -r "$version/htoprc" ]]; then
	echo "... uploading $version/htoprc to ~/.config/htop/htoprc"
	scp "$version/htoprc" "$remote":.config/htop/htoprc
fi

echo "... uploading jetbrains/ros-jetbrains-ssh-auto.sh"
scp jetbrains/ros-jetbrains-ssh-auto.sh "$remote":ros-jetbrains-ssh-auto.sh
echo "... uploading jetbrains/fake_python.sh"
scp jetbrains/fake_python.sh "$remote":fake_python.sh

echo "... uploading vscode/ros-vsc-sync.sh"
ssh "$remote" "mkdir -p bin"
scp vscode/ros-vsc-sync.sh "$remote":bin/ros-vsc-sync
