#!/bin/bash

# test-args.sh

# Intended to be used with chmod-toggle.sh
# and other wrappers that pass arguments to other scripts
# to ensure arguments are passing correctly.

echo "SCRIPT: $1"
echo "ARGUMENTS: ${@:2}"
echo
