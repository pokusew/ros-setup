#!/usr/bin/env bash

# hack around PyCharm bug
# see https://youtrack.jetbrains.com/issue/PY-23396
# see also https://intellij-support.jetbrains.com/hc/en-us/community/posts/360003435260-Pycharm-does-not-use-system-PYTHONPATH
if [[ $PYTHONPATH =~ "ROS_AUTO" && -n $PYTHONPATH_COPY ]]; then
	PYTHONPATH="$PYTHONPATH_COPY" exec /usr/bin/python "$@"
else
	exec /usr/bin/python "$@"
fi
