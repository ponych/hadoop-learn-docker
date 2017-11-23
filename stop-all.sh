#!/bin/sh
# stop-all.sh


docker rm -f $(docker ps -aq --filter="name=hadoop-slave")
docker rm -f $(docker ps -aq --filter="name=hadoop-master")
echo "all stoped"