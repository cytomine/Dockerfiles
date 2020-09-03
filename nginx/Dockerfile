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

FROM cytomine/base:v1.2.0

MAINTAINER Cytomine SCRLFS "support@cytomine.coop"

RUN apt-get -y update && apt-get install -y \
        git \
        libpcre3 \
        libpcre3-dev \
        libssl-dev \
        software-properties-common \
        zlib1g-dev
RUN add-apt-repository -y ppa:certbot/certbot && \
        apt-get -y update && \
        apt-get install -y certbot

RUN mkdir -p /opt/nginx
WORKDIR /opt/nginx
RUN wget http://nginx.org/download/nginx-1.10.1.tar.gz
RUN tar -zxvf nginx-1.10.1.tar.gz

RUN git clone https://github.com/vkholodkov/nginx-upload-module.git
RUN cd nginx-upload-module/ && git checkout 2f67cde5a0aaf7cffd43a71f5c4b443698909f4a

WORKDIR /opt/nginx/nginx-1.10.1
RUN ./configure --add-module=/opt/nginx/nginx-upload-module --with-http_ssl_module && make && make install

# Expose ports.
EXPOSE 80
EXPOSE 443

RUN mkdir -p /usr/local/nginx/html/.well-known/acme-challenge && cp /usr/local/nginx/html/index.html /usr/local/nginx/html/.well-known/acme-challenge/.

ADD 404.html /opt/nginx/nginx-1.10.1/html/404.html
ADD nginx.service /etc/init.d/nginx
ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh

ENTRYPOINT ["/tmp/deploy.sh"]
