#!/usr/bin/env bash
set -e

# Start Xvfb
if [ -z ${DISPLAY+x} ]
then
	Xvfb -ac -screen scrn 1280x2000x24 :9.0 &
	export DISPLAY=:9.0
fi

exec "$@"
