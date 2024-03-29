#!/usr/bin/env bash

# original source: https://raw.githubusercontent.com/pokusew/ros-setup/master/ide/ros-ide-sync.sh
# ros_ide_sync_version="0.0.1"
# see https://github.com/pokusew/ros-setup/blob/master/ide/README.md

find_project_root() {

	local dir="$PWD"
	local project_root

	while :; do

		local project_file="$dir/.rh_project"

		# echo "trying ${project_file}"

		if [[ -r $project_file ]]; then
			project_root="$dir"
			break
		fi

		# if "-s" is passed as first argument
		# stop and do not traverse up
		if [[ $1 == "-s" ]]; then
			break
		fi

		# this is root (project_file="/.rh_project")
		# nowhere to continue > stop
		if [[ $dir == "" ]]; then
			break
		fi

		# https://unix.stackexchange.com/a/462705
		dir="${dir%/*}"

	done

	if [[ -n $project_root ]]; then
		echo "$project_root"
		return 0
	fi

	return 1

}

source_workspace_env() {

	local setup_files_to_try=(
		"$1/install/setup.bash"
		"$1/devel/setup.bash"
	)

	for setup_file in "${setup_files_to_try[@]}"; do

		if [[ -r "$setup_file" ]]; then
			echo "sourcing $setup_file" >&2
			# shellcheck disable=SC1090
			source "$setup_file" 2>/dev/null >&2
			echo "$PYTHONPATH"
			return 0
		fi

		echo "'$setup_file' does not exist" >&2

	done

	echo "no setup file found" >&2
	return 1

}

update_vscode_settings() {

	local correct_pythonpath_after_sourcing="$1"

	local vscode_dir="$PWD/.vscode"
	mkdir -p "$vscode_dir"

	local settings_json="$vscode_dir/settings.json"

	echo "updating $settings_json ..."

	python3 "-" "$correct_pythonpath_after_sourcing" <<"EOF"
import sys
import json

settings_file_name = '.vscode/settings.json'

try:

	extraPaths = sys.argv[1].split(':') if len(sys.argv) >= 2 else []

	with open(settings_file_name, 'a+') as settings_file:
		settings = None

		settings_file.seek(0)

		try:
			settings = json.load(settings_file)
		except json.JSONDecodeError as err:
			print(f'  JSONDecodeError while parsing {settings_file_name}: {err}', file=sys.stderr)

		if not isinstance(settings, dict):
			settings = {}

		settings['python.autoComplete.extraPaths'] = extraPaths

		settings_file.seek(0)
		settings_file.truncate()

		json.dump(settings, settings_file, indent='\t')
		settings_file.write('\n');

except FileNotFoundError as err:
	print(f'  FileNotFoundError: {err}', file=sys.stderr)
EOF

	echo "  >>> updated $settings_json"

	local c_cpp_properties_json="$vscode_dir/c_cpp_properties.json"

	echo "updating $settings_json ..."

	if [[ ! -e "$c_cpp_properties_json" ]]; then
		echo "  >> created $c_cpp_properties_json"
		cat >"$c_cpp_properties_json" <<"EOF"
{
    "configurations": [
        {
            "name": "ROS 2",
            "includePath": [
                "${workspaceFolder}/**"
            ],
            "defines": [],
            "compilerPath": "/usr/bin/gcc",
            "cStandard": "c99",
            "cppStandard": "gnu++14",
            "intelliSenseMode": "linux-gcc-x64",
            "compileCommands": "${workspaceFolder}/compile_commands.json"
        }
    ],
    "version": 4
}
EOF
	else
		echo "  >> $c_cpp_properties_json already exists"
	fi

}

update_dot_env_file() {
	echo "updating $PWD/.env file ..."
	if [[ -n $2 && -n $3 ]]; then
		# remap paths
		echo "PYTHONPATH=${1//$2/$3}" >.env
	else
		echo "PYTHONPATH=$1" >.env
	fi
	echo "  >>> created $PWD/.env file"
}

update_local_python() {
	echo "updating $PWD/python.local.sh ..."
	cat >"$PWD/python.local.sh" <<-EOF
		#!/usr/bin/env bash

		# AUTO GENERATED BY ros-vsc-sync
		# put in the .gitignore
		# (https://github.com/pokusew/ros-setup/blob/master/vscode/ros-vsc-sync.sh)

		# This is a wrapper script for running the specific Python interpreter
		# with a forced PYTHONPATH (the one that is created by sourcing the ROS workspace).
		# This solves problems with JetBrains IDEs (PyCharm, CLion).
		# One can overcome the problems by starting the IDE from the sourced terminal,
		# but the IDE won't pick up new changes unless it's cache is invalidated.
		# And in the latest versions of JetBrains IDEs, it is NOT possible to just invalidate the cache.

		# .env defines PYTHONPATH variable . It is also used by VSCode's Python support.
		# load and export (maybe not needed) PYTHONPATH variable definition
		# append the original PYTHONPATH at the end
		PYTHONPATH_ORIG="\$PYTHONPATH"
		source "$PWD/.env"
		PYTHONPATH="\$PYTHONPATH\${PYTHONPATH_ORIG:+:\$PYTHONPATH_ORIG}"
		export PYTHONPATH
		# run Python and pass-trough all the arguments
		exec "$(command -v python3)" "\$@"
	EOF
	echo "  >>> created $PWD/python.local.sh file"
	chmod +x "$PWD/python.local.sh"
}

get_compilation_db() {

	if [[ -r build/compile_commands.json ]]; then
		echo "$PWD/build/compile_commands.json"
		return 0
	fi

	return 1

}

# find the project root (if possible)
if RH_PROJECT_ROOT=$(find_project_root "$@"); then
	# load the project config
	# shellcheck disable=SC1090
	source "$RH_PROJECT_ROOT/.rh_project"
	if [[ -z $RH_WORKSPACE_ROOT ]]; then
		echo "RH_WORKSPACE_ROOT is not set"
		exit 1
	fi
else
	echo "no project root found, using current working directory as project root"
	RH_PROJECT_ROOT="$PWD"
	RH_WORKSPACE_ROOT="$RH_PROJECT_ROOT"
fi

# determine absolute path to the workspace
cd "$RH_PROJECT_ROOT" || exit 1
cd "$RH_WORKSPACE_ROOT" || exit 1
RH_WORKSPACE_ROOT_ABSOLUTE="$PWD"

# jump back to to the project root from where we will do all the work
cd "$RH_PROJECT_ROOT" || exit 1

# determine the PYTHONPATH workaround dir for JetBrains IDEs
RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE="${1-"$RH_PYTHONPATH_WORKAROUND_DIR"}"

# determine the project name
RH_PROJECT_NAME="${RH_PROJECT_NAME-$(basename "$PWD")}"

# print determined values
echo "project root = $RH_PROJECT_ROOT"
echo "project name = $RH_PROJECT_NAME"
echo "workaround dir for PYTHONPATH = ${RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE:-"(not set)"}"
echo "workspace root = $RH_WORKSPACE_ROOT_ABSOLUTE"
echo "--------------"

# create symlinks to the workspace's build and install dirs in the PYTHONPATH workaround dir (if desired)
if [[ -n $RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE ]]; then
	echo "creating build and install symlinks in $RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE ..."
	rm -rf "${RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE:?"unexpected unset or empty jetbrains_pythonpath_workaround_dir"}/$RH_PROJECT_NAME"
	mkdir -p "$RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE/$RH_PROJECT_NAME"
	ln -s "$RH_WORKSPACE_ROOT_ABSOLUTE/build" "$RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE/$RH_PROJECT_NAME/build"
	echo "  >>> created $RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE/$RH_PROJECT_NAME/build that points to $RH_WORKSPACE_ROOT_ABSOLUTE/build"
	ln -s "$RH_WORKSPACE_ROOT_ABSOLUTE/install" "$RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE/$RH_PROJECT_NAME/install"
	echo "  >>> created $RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE/$RH_PROJECT_NAME/install that points to $RH_WORKSPACE_ROOT_ABSOLUTE/install"
fi

if SOURCED_PYTHONPATH=$(source_workspace_env "$RH_WORKSPACE_ROOT_ABSOLUTE"); then
	update_dot_env_file \
		"$SOURCED_PYTHONPATH" \
		"${RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE:+"$RH_WORKSPACE_ROOT_ABSOLUTE"}" \
		"${RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE:+"$RH_PYTHONPATH_WORKAROUND_DIR_EFFECTIVE/$RH_PROJECT_NAME"}"
	update_local_python
	update_vscode_settings "$SOURCED_PYTHONPATH"
fi

if [[ -r "$RH_WORKSPACE_ROOT_ABSOLUTE/build/compile_commands.json" && ! -e "$RH_PROJECT_ROOT/compile_commands.json" ]]; then
	ln -s "$RH_WORKSPACE_ROOT_ABSOLUTE/build/compile_commands.json" "$RH_PROJECT_ROOT/compile_commands.json"
	echo "created symlink to compile_commands.json in the project root"
fi
