#!/bin/bash
# Simple script to start the docker container and detach from it. 
# this ensures that we always mount the volume and it has the correct
# restart flag

if [ $# -ne 2 ] ; then
    echo "usage: ./start.sh [docker_build_tag] [path_to_results_dir]"
    exit 1;
fi

docker run -d --restart always -v $2:/opt/results $1:latest
