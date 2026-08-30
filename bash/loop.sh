#!/bin/bash

for file in "$@"
do
	if [ -f "$file" ]; then
	ls -l "$file"
		if [ -r "$file" ]; then
		echo "readable"
		else
		echo "not readable"
		fi
			if [ -w "$file" ]; then
			echo "writable"
			else
			echo "not writable"
			fi
		if [ -x "$file" ]; then
		echo "executable"
		else
		echo "not executable"
		fi
	else
	echo "File not found: $file"
	fi
done
