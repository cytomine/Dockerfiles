#
# Copyright (c) 2009-2018. Authors: see NOTICE file.
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

FROM cytomine/java8:v1.1.1

MAINTAINER Cytomine Team "support@cytomine.be"

ARG SINGULARITY_VERSION=2.4.5

RUN apt-get -y update && \
    apt-get -y install \
        apt-transport-https \
        ca-certificates \
        iptables \
        make \
        squashfs-tools \
        openssh-client \
        libarchive-dev \
        python

RUN dpkg-reconfigure locales

# Singularity installation
RUN wget https://github.com/singularityware/singularity/releases/download/$SINGULARITY_VERSION/singularity-$SINGULARITY_VERSION.tar.gz && \
    tar xvf singularity-$SINGULARITY_VERSION.tar.gz && \
    cd singularity-$SINGULARITY_VERSION && \
    ./configure --prefix=/usr/local && \
    make && \
    make install

# Software-router Installation
RUN mkdir -p /software_router && \
    cd /software_router && \
    wget http://release.cytomine.be/software-router/Cytomine-software-router.jar -O Cytomine-software-router.jar
ADD log4j.properties /software_router/


RUN mkdir -p /root/.ssh

ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh

ENTRYPOINT ["/tmp/deploy.sh"]
