readme.md


## build base image

```bash

$docker build ./base/ -t ponych/base
$docker image ls # check built image
$docker run -i -t ponych/base /bin/bash # test it
#
```


## build hadoop image

```bash
$docker build ./hadoop/ -t ponych/hadoop

```


## run

```bash
$docker network ls # 查看现有网络，如果存在了 hadoop 就不用新建了
$docker network create --driver=bridge hadoop
$docker network ls # 查看网络
$./start-container.sh
docker 
```




## 参考

* https://kiwenlau.com/2016/06/12/160612-hadoop-cluster-docker-update/
