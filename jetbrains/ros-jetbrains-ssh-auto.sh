#!/usr/bin/env bash

# TODO: describe the idea behind this solution

# USAGE: in the ~/.bashrc find and update the following part of the code:

# # If not running interactively, don't do anything
# case $- in
# *i*)
# 	# running interactively
# 	;;
#
# *)
# 	# hack for ROS via Remote Mode of JetBrain's IDEs (CLion, PyCharm)
# 	# shellcheck disable=SC1090
# 	source ~/ros-jetbrains-ssh-auto.sh
# 	# don't do anything else
# 	return
# 	;;
# esac

# ensure SSH server is listening on all needed ports (add more Port directives to /etc/sshd_config)

__ros_jetbrains_ssh_helper() {

	# SSH_CLIENT env variable is present when connected over SSH
	# SSH_CLIENT=<client IP> <client port> <server port>

	if [[ -z $SSH_CLIENT ]]; then
		# not connected over SHH
		return
	fi

	local ssh_client_parts
	# see https://github.com/koalaman/shellcheck/wiki/SC2206
	IFS=" " read -r -a ssh_client_parts <<<"$SSH_CLIENT"

	local ssh_client_server_port="${ssh_client_parts[2]}"

	__ros_jetbrains_ssh_helper_on_connection "$ssh_client_server_port"
	unset __ros_jetbrains_ssh_helper_on_connection

}

__ros_jetbrains_ssh_helper
unset __ros_jetbrains_ssh_helper
