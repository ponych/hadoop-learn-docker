FROM ubuntu:17.10
MAINTAINER ponych <ponych@qq.com>
WORKDIR /root


RUN echo "nameserver 223.6.6.6" > /etc/resolv.conf
RUN sed -i 's/archive.ubuntu/mirrors.aliyun/' /etc/apt/sources.list
RUN apt-get update && apt-get dist-upgrade -y

