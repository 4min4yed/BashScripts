#!/bin/bash
while true; do
	if [ $# -gt 2 ] || [ $# -eq 0 ]
	then
		echo -e " enter RM [Option]\nOptions:\na for all process info\ncpuid for PIDs with the most CPU usage (desc)\nmemid for PIDs with the most memory usage (desc)\n "
		
	elif [ $# -eq 1 ]
	then
		if [ "$1" = "a" ]
		then
			echo -a `ps` 
		fi
	fi
	exit 0
done
