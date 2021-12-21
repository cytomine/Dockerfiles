#
# Copyright (c) 2009-2020. Authors: see NOTICE file.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM tomcat:9.0-jdk8-openjdk

MAINTAINER Cytomine SCRLFS "support@cytomine.coop"


# base librairies and configuration
RUN apt-get update -y && apt-get -y install \
      build-essential \
      curl \
      locate \
      logrotate \
      net-tools \
      unzip \
      wget

RUN sed -i "/su root syslog/c\su root root" /etc/logrotate.conf
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive


#tomcat configuration

RUN apt-get -y update && apt-get install -y autoconf automake libpopt-dev libtool make xz-utils
RUN cd /tmp/ && wget https://github.com/logrotate/logrotate/releases/download/3.18.0/logrotate-3.18.0.tar.xz && tar -xJf logrotate-3.18.0.tar.xz
RUN cd /tmp/logrotate-3.18.0 && autoreconf -fiv && ./configure && make

RUN cp /tmp/logrotate-3.18.0/logrotate /usr/sbin/logrotate


# ims specificities

RUN apt-get update -y && apt-get install -y \
      ant \
      dnsutils \
      git \
      gobject-introspection \
      gtk-doc-tools \
      iipimage-server \
      imagemagick \
      libgirepository1.0-dev \
      libglib2.0-dev \
      libgsf-1-dev \
      libjpeg62-turbo-dev \
      libmemcached-dev \
      libopenjp2-7-dev \
      libsqlite3-dev \
      libtiff5-dev \
      libtiff-tools \
      libvips-dev \
      libxml2-dev \
      openslide-tools \
      swig

#openslide
RUN cd /tmp && git clone https://github.com/cytomine/openslide && cd /tmp/openslide && git checkout 3a284f9ab4fb39f5081f61f1b0169cdda8dde962 && autoreconf -i && ./configure && make && make install

# vips
RUN cd /tmp && wget https://github.com/libvips/libvips/releases/download/v8.10.6/vips-8.10.6.tar.gz && tar -zxvf ./vips-8.10.6.tar.gz && cd ./vips-8.10.6 && LDFLAGS="-L/usr/local/lib -lopenslide" CPPFLAGS="-I/usr/local/include/openslide"  ./configure && make && make install

#openslide-java
RUN export JAVA_HOME=/usr/local/openjdk-8 && export CFLAGS="-I/usr/local/openjdk-8" && cd /tmp && git clone https://github.com/cytomine/openslide-java && cd /tmp/openslide-java && git checkout 93af97eeca8f0b63e9f71a6916af474ecc474dc8 && autoreconf -i && ./configure && make && make install


EXPOSE 8081
EXPOSE 8082

RUN ldconfig -v

RUN ln -s /usr/local/tomcat /var/lib/tomcat9 #for backward compatibility
RUN ln -s /usr/share/tomcat9/.grails /root/.grails #for backward compatibility

RUN chmod -R 777 /var/lib/tomcat9
RUN rm -rf /var/lib/tomcat9/webapps/* && cd /var/lib/tomcat9/webapps/ && wget https://github.com/cytomine/Cytomine-IMS/releases/download/v1.2.6/IMS.war -O ROOT.war
RUN cd /var/lib/tomcat9/  && wget -q https://github.com/cytomine/Cytomine-IMS/releases/download/v1.2.6/restapidoc.json -O restapidoc.json

RUN mkdir -p /usr/share/tomcat9/.grails

RUN touch /tmp/addHosts.sh
ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh
ADD setenv.sh /tmp/setenv.sh
RUN chmod +x /tmp/setenv.sh

ENTRYPOINT ["/tmp/deploy.sh"]

