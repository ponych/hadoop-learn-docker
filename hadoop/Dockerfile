FROM base:latest
MAINTAINER ponych <ponych@qq.com>
WORKDIR /root

# download hadoop before build image to local webroot

RUN apt-get install -y openssh-server openjdk-8-jdk wget

ENV hadoop hadoop-2.8.1

RUN wget http://172.17.0.1/${hadoop}.tar.gz && \
    tar -xzf ${hadoop}.tar.gz && \
    rm ${hadoop}.tar.gz && \
    mv ${hadoop} /usr/local/hadoop

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin:$JAVA_HOME/bin

COPY config/* /tmp/

RUN mv /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \


