FROM jetthoughts/centos7
MAINTAINER Michael Nikitochkin <miry.sof@gmail.com>

#Install Docker
# This will use the 1.8.2 release
RUN wget -O /usr/local/bin/docker https://get.docker.io/builds/Linux/x86_64/docker-1.8.2
RUN chmod +x /usr/local/bin/docker
ADD 10_wrapdocker.sh /etc/my_init.d/10_wrapdocker.sh
RUN groupadd docker

# Create Teamcity User
RUN adduser teamcity
#RUN sed -i -e "s/%sudo.*$/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/" /etc/sudoers
RUN usermod -a -G docker teamcity

# Run script
ADD setup.sh /setup.sh
RUN chown teamcity:teamcity /setup.sh
RUN chmod +x /setup.sh

#Ruby/Rails projects dependicies
RUN yum install -y \
               ruby rubygems git-core zlib zlib-devel gcc-c++ patch \
               readline readline-devel libyaml-devel libffi-devel \
               openssl-devel make bzip2 autoconf automake libtool \
               bison curl sqlite-devel zip ruby-dev mysql-devel ruby-devel rubygems \
               epel-release qtwebkit-devel \
               mariadb-server postgresql-server redis

RUN ln -s /usr/lib64/qt4/bin/qmake /usr/bin/qmake
RUN yum install -y xorg-x11-server-Xvfb
RUN yum install -y psmisc
RUN yum install -y mysql postgresql postgresql-libs postgresql-devel
RUN yum install -y nodejs

RUN mkdir -p /opt
RUN git clone https://github.com/sstephenson/rbenv.git /opt/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build
RUN /opt/rbenv/plugins/ruby-build/install.sh
ENV PATH /opt/rbenv/bin:$PATH
RUN echo 'export PATH=/opt/rbenv/bin:$PATH' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'export RBENV_ROOT="/opt/rbenv"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(/opt/rbenv/bin/rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
ENV CONFIGURE_OPTS --disable-install-doc
RUN echo 'gem: --no-rdoc --no-ri --no-document' >> /root/.gemrc
RUN bash -l -c 'for i in "2.2.3" ; do rbenv install $i ; rbenv global $i; gem install bundler --no-document; done'
#RUN bash -l -c 'for i in "2.1.1" "2.1.2" "2.1.5" "2.1.6" "2.2.1" "2.2.2" "2.2.3" ; do rbenv install $i ; rbenv global $i; gem install bundler --no-document; done'

RUN chown teamcity:teamcity -R /opt/rbenv

VOLUME /home/teamcity

CMD bash -c "chown teamcity:teamcity -R /home/teamcity; su teamcity -l -c \"TEAMCITY_SERVER=$TEAMCITY_SERVER DOCKER_HOST=$DOCKER_HOST DOCKER_TLS_VERIFY=$DOCKER_TLS_VERIFY DOCKER_CERT_PATH=$DOCKER_CERT_PATH /setup.sh run\""

RUN mysql_install_db
RUN chown mysql:mysql -R /var/lib/mysql
RUN su postgres -l -c "/usr/bin/initdb /var/lib/pgsql/data/"
