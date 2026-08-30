#!/bin/bash

if [ $# -ne 2 ]; then 
	echo "Error: you must provide exactly 2 arguments"
	exit 1
fi

if [ -z "$1" ]; then
	echo "Error: name cannot be empty"
	exit 1
fi

if [ -z "$2" ]; then
	echo "Error: role cannot be empty"
	exit 1
fi
echo "Hello $1 $2"
