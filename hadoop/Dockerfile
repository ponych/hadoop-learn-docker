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
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
    mv /tmp/run-wordcount.sh ~/run-wordcount.sh

RUN chmod +x ~/start-hadoop.sh && \
    chmod +x ~/run-wordcount.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh

RUN $HADOOP_HOME/bin/hdfs namenode -format

CMD ["sh" ,"-c" , "service ssh start; bash"]
