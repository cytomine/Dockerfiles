#
# Copyright (c) 2009-2021. Authors: see NOTICE file.
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


# core specificities

RUN ln -s /usr/local/tomcat /var/lib/tomcat9 #for backward compatibility
RUN ln -s /usr/share/tomcat9/.grails /root/.grails #for backward compatibility

RUN rm -rf /var/lib/tomcat9/webapps/* && cd /var/lib/tomcat9/webapps/  && wget https://github.com/cytomine/Cytomine-core/releases/download/v3.2.0/Core.war -O ROOT.war
RUN cd /var/lib/tomcat9/  && wget https://github.com/cytomine/Cytomine-core/releases/download/v3.2.0/restapidoc.json -O restapidoc.json

RUN mkdir -p /usr/share/tomcat9/.grails

RUN touch /tmp/addHosts.sh
ADD setenv.sh /tmp/setenv.sh
RUN chmod +x /tmp/setenv.sh
ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh

ENTRYPOINT ["/tmp/deploy.sh"]
