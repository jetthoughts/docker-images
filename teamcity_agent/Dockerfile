FROM jetthoughts/centos
MAINTAINER Michael Nikitochkin <miry.sof@gmail.com>

RUN adduser teamcity
ADD setup.sh /setup.sh
RUN chown teamcity:teamcity /setup.sh
RUN chmod +x /setup.sh

#Ruby/Rails projects dependicies
RUN yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel zip
RUN mkdir -p /opt
RUN git clone https://github.com/sstephenson/rbenv.git /opt/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build
RUN /opt/rbenv/plugins/ruby-build/install.sh
ENV PATH /opt/rbenv/bin:$PATH
RUN echo 'PATH=/opt/rbenv/bin:$PATH' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'RBENV_ROOT="/opt/rbenv"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(/opt/rbenv/bin/rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
ENV CONFIGURE_OPTS --disable-install-doc
RUN echo 'gem: --no-rdoc --no-ri --no-document' >> /root/.gemrc
RUN bash -l -c 'for i in "2.2.2" "2.2.1" "2.2.0" "2.1.6" ; do rbenv install $i ; rbenv global $i; gem install bundler --no-document; done'

VOLUME /home/teamcity

CMD su teamcity -l -c "TEAMCITY_SERVER=$TEAMCITY_SERVER /setup.sh run"
