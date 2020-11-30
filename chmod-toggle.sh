#!/bin/bash

# chmod-toggle.sh

# A wrapper for chmod that gives the user permission to execute a script
# Executes the script, then turns user permissions to execute off.
# Intended for disposable, occasional shell script, 
# Not for use in scripts in a bin directory in PATH or as root.

# USAGE: ./chmod-toggle.sh /path/to/script {arg1} {arg2} {arg3}

source .scwconfig

declare -rg TRUE=0
declare -rg FALSE=1

cd $DISPOSABLE_SCRIPTS  # defined in .scwconfig

SCRIPT=$(basename $1)

function resolvescript() {
	local REALPATH=$(realpath $SCRIPT)
	local SCRIPT_VALID=$DISPOSABLE_SCRIPTS/$SCRIPT
	[[ -f "$SCRIPT_VALID" ]] && { echo "$REALPATH"; } || exit $FALSE
}

function cleanup() {
	sudo chmod ugo-x $(realpath $SCRIPT)
}
trap cleanup EXIT

function is_user_root() {
	[[ $(id -u) -eq 0 ]] && return $TRUE || return $FALSE
}


# Exceptions
[ $# -eq 0 ] && { echo "Usage: $0 filename.sh {args-to-filename.sh}"; exit 1; }
is_user_root && { echo "Do not run this script as root"; exit $FALSE; }

SCRIPT_PATH=$(resolvescript $SCRIPT)


# Main
echo "################"
echo "Making $SCRIPT executable"

# Assert that group and other never has permission to run scripts passed to this.
sudo chmod go-x "$SCRIPT_PATH"

# Allow user to run the script
sudo chmod u+x "$SCRIPT_PATH"

echo "Attempting to execute ~/$(basename $DISPOSABLE_SCRIPTS)/$SCRIPT"
echo

if [ $DISPOSABLE_SCRIPT_TESTING -eq $TRUE ]; then
	echo "Running tests on args before executing..."
	TEST_ARGS_SH="$DISPOSABLE_SCRIPTS/test-args.sh"
	if [ -f "$TEST_ARGS_SH" ]; then
        	bash "$TEST_ARGS_SH" "$@"
	fi
fi

read -p "Press enter to run or CTR+C to cancel."
bash "$SCRIPT_PATH" "$@"
	
echo 
echo "$SCRIPT finished running and is no longer executable."
echo "################"
exit $TRUE
