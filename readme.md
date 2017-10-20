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

