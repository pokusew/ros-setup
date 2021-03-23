#!/usr/bin/env bash

# see https://github.com/pokusew/ubuntu-ros/blob/master/vscode/README.md

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

	echo "updating $PWD/.vscode/settings.json ..."

	mkdir -p .vscode

	python3 "-" "$1" <<"EOF"
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

	echo "  >>> updated $PWD/.vscode/settings.json"

}

update_dot_env_file() {
	echo "updating $PWD/.env file ..."
	echo "PYTHONPATH=$1" >.env
	echo "  >>> created $PWD/.env file"
}

get_compilation_db() {

	if [[ -r build/compile_commands.json ]]; then
		echo "$PWD/build/compile_commands.json"
		return 0
	fi

	return 1

}

if ! RH_PROJECT_ROOT=$(find_project_root "$@"); then
	echo "no project root found"
	exit 1
fi

cd "$RH_PROJECT_ROOT" || exit 1
echo "project root = $PWD"
# shellcheck disable=SC1090
source "$RH_PROJECT_ROOT/.rh_project"
if [[ -z $RH_WORKSPACE_ROOT ]]; then
	echo "RH_WORKSPACE_ROOT is not set"
	exit 1
fi
echo "workspace root = $RH_WORKSPACE_ROOT"

if SOURCED_PYTHONPATH=$(source_workspace_env "$RH_WORKSPACE_ROOT"); then
	update_dot_env_file "$SOURCED_PYTHONPATH"
	update_vscode_settings "$SOURCED_PYTHONPATH"
fi

if [[ -r $RH_WORKSPACE_ROOT/build/compile_commands.json && ! -e compile_commands.json ]]; then
	ln -s "$RH_WORKSPACE_ROOT/build/compile_commands.json" compile_commands.json
	echo "created symlink to compile_commands.json in project root"
fi
