#!/bin/bash -e

if [ ${USER} == root ]
then
	echo "Your root, hi!"
	return 
fi
COUNT=`echo ${SSH_CONNECTION} | wc -c`
DOCKER_RUN="docker run -it -e USER=${USER} -v /opt/shapeos:/custom  -v /opt/user_data:/opt/user_data -v /var/run/docker.sock:/docker_on_host.sock --privileged --ipc host --net host"
if [ $COUNT -eq 1 ]
then
	echo "[-] Get update for ShapeOS"
        docker pull bres/shape-os
        if [ -f /opt/shapeos/Dockerfile ]
	then
             echo "[-] Run build custom image"
    	     docker build -t bres/shape-os:local /opt/shapeos/
	fi
	if [ "x`docker images bres/shape-os:local -q`" == "x" ]
	then
             echo "[-] Run ShapeOS latest"
             exec $DOCKER_RUN bres/shape-os:latest
	else 
             echo "[-] Run ShapeOS local"
             exec $DOCKER_RUN bres/shape-os:local
	fi
else
	echo Welcome
fi

