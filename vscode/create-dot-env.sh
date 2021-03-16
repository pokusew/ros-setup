#!/usr/bin/env bash

# see https://github.com/pokusew/ubuntu-ros/blob/master/vscode/README.md

setup_files_to_try=(
	'install/setup.bash'
	'devel/setup.bash'
)

for setup_file in "${setup_files_to_try[@]}"; do
	if [[ -r "$setup_file" ]]; then
		echo "sourcing $setup_file"
		# shellcheck disable=SC1090
		source "$setup_file"
		echo "PYTHONPATH=$PYTHONPATH" >.env
		echo "created .env file with the following content:"
		cat .env
		exit 0
	fi
	echo "'$setup_file' does not exist"
done

echo "not setup file found > not .env file created"
exit 1
