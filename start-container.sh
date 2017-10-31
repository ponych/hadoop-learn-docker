#!/bin/sh

#start-container.sh

N=${1:-3} # 命令行参数，默认3

echo $N

# rm pre-exist hadoop-master
# start master container
docker rm -f hadoop-master
docker run -itd \
       --network=hadoop \
       -p 50070:50070 \
       -p 8088:8088 \
       --name hadoop-master \
       ---hostname hadoop-master \
       ponych/hadoop

# start slave container
i=1
# remove pre-exist slave
while [ $i -lt $N ]
do
  docker rm -f hadoop-slave$i
done

j=1

while [ $j -lt $N ]
do
  docker run -itd \
             --network=hadoop \
             --hostname=hadoop-slave$j \
             ponych/hadoop
done

docker exec -it hadoop-master bash
