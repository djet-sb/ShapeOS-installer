#!/bin/bash
if [ "${SSH_CONNECTION}x" == "x" ]
then
	echo "[-] Get update for ShapeOS"
        docker pull bres/shape-os
        echo "[-] Run ShapeOS"
        docker run -it -e USER=${USER} -v /opt/user_data:/home/ -v /var/run/docker.sock:/var/run/docker.sock -v /dev/:/dev/ --privileged --ipc host --net host bres/shape-os	
else
	echo Welcome
fi
