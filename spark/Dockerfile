FROM jetthoughts/centos7
MAINTAINER Michael Nikitochkin <miry.sof@gmail.com>

# Create Spark User
RUN adduser spark

RUN mkdir -p /opt/spark
RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.4.1-bin-hadoop2.6.tgz | tar --strip-components=1 -xvz -C /opt/spark

ENV YOUR_SPARK_HOME /opt/sprak
ENV PATH /opt/spark/bin:$PATH

WORKDIR /opt/spark
RUN chown spark:spark -R /opt/spark
