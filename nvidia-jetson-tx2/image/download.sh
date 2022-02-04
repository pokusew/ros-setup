#!/usr/bin/env bash

# rsync
# man page: https://linux.die.net/man/1/rsync

# https://stackoverflow.com/questions/16647476/how-to-rsync-only-a-specific-list-of-files?rq=1

# --filter='merge download-filter.txt' \

# -a, --archive     archive mode; same as -rlptgoD (no -H);
#                   only exception when --files-from is specified, in which case -r is not implied
#   -r, --recursive   recurse into directories
#   -l, --links       copy symlinks as symlinks
#   -p, --perms       preserve permissions
#   -t, --times       preserve times
#   -g, --group       preserve group
#   -o, --owner       preserve owner (super-user only)
#   (no  -H, --hard-links            preserve hard links)
rsync -a \
	-v \
	--port=8730 \
	--fake-super \
	--filter='merge rules.txt' \
	rsync://localhost/root/ \
	data/
