FROM ubuntu:zesty

RUN apt-get update \
 && apt-get install -y wget
ADD https://minergate.com/download/deb-cli ./minergate-cli.deb
RUN dpkg -i minergate-cli.deb

CMD minergate-cli -user miry.sof@gmail.com -xmr 
