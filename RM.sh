#!/bin/bash
while true; do
	echo -e "enter [Option]\nOptions:\na for all process info\ncpuid for PIDs with the most CPU usage (desc)\nmemid for PIDs with the most memory usage (desc)\nq to quit the Program "
	read x	
	if [ "$x" = "a" ]
	then
		ps -aux 
	elif [ "$x" = "cpuid" ]
	then
		ps -aux | awk '{print $2,":  "$11,"--->> ", $3, "%" }'
	elif [ "$x" = "memid" ]
	then
		ps -aux | awk '{print $2,":  "$11,"--->> ", $4, "%" }'
	elif [ "$x" = "q" ]
	then
		echo "Ending... thanks for using our program"
		exit 0
	fi
done
