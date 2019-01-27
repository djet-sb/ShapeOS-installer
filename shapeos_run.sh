#!/bin/bash


COUNT=`echo ${SSH_CONNECTION} | wc -c`

if [ $COUNT -eq 1 ]
then
	echo "[-] Get update for ShapeOS"
        docker pull bres/shape-os
        if [ -f /opt/shapeos/Dockerfile ]
	then
             echo "[-] Run build custom image"
    	     docker build -t bres/shape-os /opt/shapeos/
	fi
        echo "[-] Run ShapeOS"
        docker run -it -e USER=${USER} -v /opt/user_data:/home/ -v /var/run/docker.sock:/docker.sock -v /dev/:/dev/ --privileged --ipc host --net host bres/shape-os	
else
	echo Welcome
fi
