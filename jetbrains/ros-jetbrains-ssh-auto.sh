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

	case $ssh_client_server_port in

	"23")
		# port 23 <-> ROS 1 /home/pokusew/remote/ros1-tutorial/catkin_ws project
		source /opt/ros/kinetic/setup.bash
		if [[ -r /home/pokusew/remote/ros1-tutorial/catkin_ws/devel/setup.bash ]]; then
			source /home/pokusew/remote/ros1-tutorial/catkin_ws/devel/setup.bash
		fi
		# hack for PyCharm Remote Mode bug (used by fake-python.sh wrapper)
		export PYTHONPATH_COPY="$PYTHONPATH"
		;;

	"24")
		# port 24 <-> ROS 1 /home/pokusew/remote/f1tenth/base_overlay project
		source /opt/ros/kinetic/setup.bash
		if [[ -r /home/pokusew/remote/f1tenth/base_overlay/devel/setup.bash ]]; then
			source /home/pokusew/remote/f1tenth/base_overlay/devel/setup.bash
		fi
		# hack for PyCharm Remote Mode bug (used by fake-python.sh wrapper)
		export PYTHONPATH_COPY="$PYTHONPATH"
		;;

	*)
		# unknown port <-> ROS project mapping
		;;

	esac

}

__ros_jetbrains_ssh_helper
unset __ros_jetbrains_ssh_helper
