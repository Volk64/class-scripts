#!/bin/bash

for i in $(cat /etc/passwd);do
	USERNAME= echo $i | cut -d: -f1;
	USERID= echo $i | cut -d: -f3;
	echo "\n"
done;
