#!/bin/bash

if [ -z "${1}" ]; then
	echo "!!! You must provide an Apache log !!!"
	exit 1
elif [ ! -f "${1}" ]; then
	echo "!!! Provided file does not exist !!!"
	exit 2
fi

echo "Please enter the type of logs you want me to count. (error|notice)"
read answer

numberOfLogs=0
if [ "$answer" = "error" ]; then
	numberOfLogs=$(awk '/\[error\]/ {print}' "${1}" | wc -l)
elif [ "$answer" = "notice" ]; then
	numberOfLogs=$(awk '/\[notice\]/ {print}' "${1}" | wc -l)
fi
echo "Apache log contains $numberOfLogs logs of type: $answer";

exit 0

