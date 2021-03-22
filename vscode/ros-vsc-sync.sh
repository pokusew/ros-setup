#!/usr/bin/env bash

# see https://github.com/pokusew/ubuntu-ros/blob/master/vscode/README.md

source_workspace_env() {

	rh wcd >&2

	local setup_files_to_try=(
		'install/setup.bash'
		'devel/setup.bash'
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
			print(f'JSONDecodeError while parsing {settings_file_name}: {err}', file=sys.stderr)

		if not isinstance(settings, dict):
			settings = {}

		settings['python.autoComplete.extraPaths'] = extraPaths

		settings_file.seek(0)
		settings_file.truncate()

		json.dump(settings, settings_file, indent='\t')
		settings_file.write('\n');

except FileNotFoundError as err:
	print(err, file=sys.stderr)
EOF

}

update_dot_env() {
	echo "PYTHONPATH=$1" >.env
	echo "created .env file with the following content:"
	cat .env
}

get_compilation_db() {

	rh wcd >&2

	if [[ -r build/compile_commands.json ]]; then
		echo "$PWD/build/compile_commands.json"
		return 0
	fi

	return 1

}

if SOURCED_PYTHONPATH=$(source_workspace_env); then
	mkdir -p .vscode
	update_dot_env "$SOURCED_PYTHONPATH"
	update_vscode_settings "$SOURCED_PYTHONPATH"
else
	echo "nothing created"
	exit 1
fi

if COMPILATION_DB_PATH=$(get_compilation_db); then
	if [[ ! -e compile_commands.json ]]; then
		ln -s "$COMPILATION_DB_PATH" compile_commands.json
	fi
fi
