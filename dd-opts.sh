#!/bin/bash

# dd-opts.sh

# Passes a block device and an iso path to dd, running it with my standard options

# Input validation
if [ ! -f "$2" ]; then
	echo "Bad input file $2. You need an iso file that exists."
fi
if [ ! -e "$3" ]; then
	echo "Bad block device path $3. Use lsblk to find /dev/sdax"
fi

# Feedback
echo
echo "Should be executing:"
echo "dd if="$2" of="$3" status=progress bs=4MB oflag=sync"
echo
lsblk | grep sda
echo
read -p "Press enter to run or CTR+C to cancel."
echo

sudo dd if="$2" of="$3" status=progress bs=4MB oflag=sync
