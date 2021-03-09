# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# it is called automatically when ~/ros-jetbrains-ssh-auto.sh is sourced
# and upon invocation it is automatically also unset
__ros_jetbrains_ssh_helper_on_connection() {

	# $1 is the SSH port
	case $1 in

	# "23")
	# 	# port 23 <-> ROS 1 /home/pokusew/remote/ros1-tutorial/catkin_ws project
	# 	source /opt/ros/kinetic/setup.bash
	# 	if [[ -r /home/pokusew/remote/ros1-tutorial/catkin_ws/devel/setup.bash ]]; then
	# 		source /home/pokusew/remote/ros1-tutorial/catkin_ws/devel/setup.bash
	# 	fi
	# 	# hack for PyCharm Remote Mode bug (used by fake-python.sh wrapper)
	# 	export PYTHONPATH_COPY="$PYTHONPATH"
	# 	;;

	# "24")
	# 	# port 24 <-> ROS 1 /home/pokusew/remote/f1tenth/base_overlay project
	# 	source /opt/ros/kinetic/setup.bash
	# 	if [[ -r /home/pokusew/remote/f1tenth/base_overlay/devel/setup.bash ]]; then
	# 		source /home/pokusew/remote/f1tenth/base_overlay/devel/setup.bash
	# 	fi
	# 	# hack for PyCharm Remote Mode bug (used by fake-python.sh wrapper)
	# 	export PYTHONPATH_COPY="$PYTHONPATH"
	# 	;;

	*)
		# unknown port <-> ROS project mapping
		;;

	esac

}

# If not running interactively, don't do anything
case $- in
*i*)
	# running interactively
	;;

*)
	# hack for ROS via Remote Mode of JetBrain's IDEs (CLion, PyCharm)
	# shellcheck disable=SC1090
	source ~/ros-jetbrains-ssh-auto.sh
	# don't do anything else
	return
	;;
esac

# original history related config:

## don't put duplicate lines or lines starting with space in the history.
## See bash(1) for more options
#HISTCONTROL=ignoreboth
#
## append to the history file, don't overwrite it
#shopt -s histappend
#
## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

###
# HSTR
# Easily view, navigate and search your command history
# with shell history suggest box for Bash and zsh.
# source: https://github.com/dvorka/hstr
###
export HH_CONFIG=hicolor                                          # get more colors
shopt -s histappend                                               # append new history items to .bash_history
# export HISTCONTROL=ignorespace # leading space hides commands from history
export HISTCONTROL=ignoreboth                                     # see https://askubuntu.com/a/15929
export HISTFILESIZE=10000                                         # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}                                   # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}" # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hh -k \C-j"'; fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# original PS1 related config:

## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color | *-256color) color_prompt=yes ;;
#esac
#
## uncomment for a colored prompt, if the terminal has the capability; turned
## off by default to not distract the user: the focus in a terminal window
## should be on the output of commands, not on the prompt
##force_color_prompt=yes
#
#if [ -n "$force_color_prompt" ]; then
#	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#		# We have color support; assume it's compliant with Ecma-48
#		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#		# a case would tend to support setf rather than setaf.)
#		color_prompt=yes
#	else
#		color_prompt=
#	fi
#fi
#
#if [ "$color_prompt" = yes ]; then
#	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
#
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm* | rxvt*)
#	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#	;;
#*) ;;
#
#esac

###
# bash-powerline
# Powerline for Bash in pure Bash script.
###
# shellcheck source=../bash-powerline.sh
source "$HOME/pokusew-bash-powerline.sh"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# utils
export EDITOR="nano"
alias bre='source ~/.bashrc'
alias bed='nano ~/.bashrc'

###
# Git shortcuts
###
alias gst="git status"
# gh is GitHub CLI (https://github.com/cli/cli)
alias gho="gh repo view --web"
# see https://git-scm.com/docs/git-log
# see https://stackoverflow.com/a/1441062
alias glog2="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short-local"
# see https://stackoverflow.com/a/9463536
# show "G" for a good (valid) signature,
# "B" for a bad signature,
# "U" for a good signature with unknown validity,
# "X" for a good signature that has expired,
# "Y" for a good signature made by an expired key,
# "R" for a good signature made by a revoked key,
# "E" if the signature cannot be checked (e.g. missing key) and "N" for no signature
alias glog="git log --pretty=format:'%C(auto,yellow)%h%C(auto,magenta)% G? %C(auto,blue)%ad %C(auto,green)%aN%C(auto,red)%d%C(auto,reset) %s' --date=format-local:'%Y-%m-%d %H:%M'"
alias glog-tags="glog --no-walk --all" # optionally use --tags instead of --all
gapr() {
	echo "Running after PR rebase sequence ..."
	echo "branch = '$1'"
	if [[ -z $1 ]]; then
		echo "No branch specified!"
		return 1
	fi
	git checkout master &&
		git push origin ":$1" &&
		git pull && git fetch --all --prune &&
		git branch -D "$1" &&
		echo "Finished."
}

# ROS
export RH_PROJECTS_DIRS="$HOME/remote"
export RH_ROS_INSTALL_DIRS="/opt/ros"
source ~/rh.sh
rh sw foxy --silent

# TODO: once merge in rh
# usage: rh-set-master <target>
# targets:
# - local
#     export ROS_HOSTNAME=ubuntu16-ros
#     export ROS_MASTER_URI=http://ubuntu16-ros:11311
# - tx2-auto-3
#     export ROS_IP=192.168.222.1
#     export ROS_MASTER_URI=http://192.168.222.1:11311
ros-set-master() {

	local target="$1"

	if [[ -z $target ]]; then
		echo "current ROS network related config:"
		[[ -n $ROS_HOSTNAME ]] &&
			echo "  ROS_HOSTNAME = $ROS_HOSTNAME"
		[[ -n $ROS_IP ]] &&
			echo "  ROS_IP = $ROS_IP"
		[[ -n $ROS_MASTER_URI ]] &&
			echo "  ROS_MASTER_URI = $ROS_MASTER_URI"
		echo "use to switch to predefined target: ros-set-master <target>"
		return 0
	fi

	unset ROS_HOSTNAME
	unset ROS_IP
	unset ROS_MASTER_URI

	case $target in

	"local")
		export ROS_HOSTNAME=ubuntu16-ros
		export ROS_MASTER_URI=http://ubuntu16-ros:11311
		rh env
		return 0
		;;

	"tx2-auto-3")
		export ROS_IP=192.168.222.1
		export ROS_MASTER_URI=http://192.168.222.1:11311
		rh env
		return 0
		;;

	*)
		echo "unknown target '$target'"
		return 1
		;;

	esac

}

# register word-list autocompletion for rh-set-master command
complete -W "local tx2-auto-3" ros-set-master

# ros-set-master "local" >/dev/null 2>&1
