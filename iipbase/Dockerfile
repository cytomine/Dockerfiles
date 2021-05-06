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

FROM cytomine/base:v1.3.0

MAINTAINER Cytomine SCRLFS "support@cytomine.coop"

RUN sed -i "s/\# deb-src http:\/\/archive.ubuntu.com\/ubuntu\/ focal universe/deb-src http:\/\/archive.ubuntu.com\/ubuntu\/ focal universe/g" /etc/apt/sources.list

RUN apt-get -y update && \
    apt-get install -y \
      git \
      libjpeg8-dev \
      libmemcached-dev \
      libopenjp2-7-dev \
      libssl-dev \
      libtiff5-dev \
      psmisc \
      software-properties-common && \
      apt-get -y build-dep iipimage-server openslide


ARG NGINX_VERSION=1.15.1
RUN cd /tmp && \
    wget https://nginx.org/download/nginx-$NGINX_VERSION.tar.gz && \
    tar -zxvf nginx-$NGINX_VERSION.tar.gz && \
    rm nginx-$NGINX_VERSION.tar.gz && \
    cd /tmp/nginx-$NGINX_VERSION && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/*


RUN mkdir -p /opt/cytomine/bin

ADD start-iip.sh /opt/cytomine/bin/start-iip.sh
ADD stop-iip.sh /opt/cytomine/bin/stop-iip.sh
ADD check-iip-status.py /opt/cytomine/bin/check-iip-status.py
ADD crontab /tmp/crontab
ADD iipservice /etc/init.d/iip
RUN chmod 755 /etc/init.d/iip
RUN chmod +x /opt/cytomine/bin/stop-iip.sh
RUN chmod +x /opt/cytomine/bin/start-iip.sh

ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh


