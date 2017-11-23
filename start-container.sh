#!/bin/sh

#start-container.sh

N=${1:-3} # 命令行参数，默认3

echo "start ${N} slave"

# rm pre-exist hadoop-master
# docker rm -f $(docker ps -aq --filter="ancestor=ponych/hadoop")
docker rm -f $(docker ps -aq --filter="name=hadoop-slave")
docker rm -f $(docker ps -aq --filter="name=hadoop-master")


# start master container
# docker rm -f hadoop-master
echo "start master"
docker run -itd \
       --network=hadoop \
       -p 50070:50070 \
       -p 8088:8088 \
       --name hadoop-master \
       --hostname hadoop-master \
       ponych/hadoop

# start slave container



j=1

#while [ $j -lt $N ]
#do
#  docker run -itd \
#             --network=hadoop \
#             --hostname=hadoop-slave$j \
#             ponych/hadoop
#done
i=1
while [ $i -lt $N ]
do
  echo "start hadoop-slave$i container"
  docker run -itd \
             --network=hadoop \
             --name=hadoop-slave$i \
             --hostname=hadoop-slave$ \
             ponych/hadoop &> /dev/null

  i=$(($i +1))
done
# get into hadoop master container
docker exec -it hadoop-master bash