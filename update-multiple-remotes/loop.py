#!/usr/bin/python3
# Sample script to loop amount of argument and log

import time
import sys

with open("loop-log.txt", 'w') as f:
	for i in range(int(sys.argv[1])):
		f.write(f"{i}\n")
		time.sleep(1)
	
