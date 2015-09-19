FROM jetthoughts/centos7
MAINTAINER Michael Nikitochkin <miry.sof@gmail.com>

# Install SBT tool to build scala applications
RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo
RUN yum install sbt -y

# Create Spark User
RUN adduser spark

RUN mkdir -p /opt/spark /app
RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.4.1-bin-hadoop2.6.tgz | tar --strip-components=1 -xvz -C /opt/spark

ENV YOUR_SPARK_HOME /opt/sprak
ENV PATH /opt/spark/bin:$PATH

RUN chown spark:spark -R /opt/spark /app

WORKDIR /app
