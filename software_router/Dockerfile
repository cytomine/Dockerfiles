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

FROM cytomine/java8:v1.2.0

MAINTAINER Cytomine SCRLFS "support@cytomine.coop"

ARG SINGULARITY_VERSION=3.1.0

RUN apt-get -y update && \
    apt-get install -y \
	build-essential \
	git \
	libssl-dev uuid-dev \
	libgpgme11-dev \
	squashfs-tools \
	libseccomp-dev \
	pkg-config

ARG VERSION=1.11.4
ARG OS=linux
ARG ARCH=amd64
ARG GOPATH=${HOME}/go
RUN cd /tmp && wget https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz && tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

RUN dpkg-reconfigure locales

ENV PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin

RUN go get -u github.com/golang/dep/cmd/dep

# Singularity installation
RUN mkdir -p $GOPATH/src/github.com/sylabs && \
    cd $GOPATH/src/github.com/sylabs && \
    wget https://github.com/sylabs/singularity/releases/download/v$SINGULARITY_VERSION/singularity-$SINGULARITY_VERSION.tar.gz && \
    tar xvf singularity-$SINGULARITY_VERSION.tar.gz && \
    cd singularity && \
    ./mconfig

RUN cd $GOPATH/src/github.com/sylabs/singularity/builddir && \
    make && \
    make install

#Docker installation
RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce

# Software-router Installation
#TODO put download the right software_router
#RUN mkdir -p /software_router && \
#    cd /software_router && \
#    wget http://release.cytomine.be/software-router/Cytomine-software-router.jar -O Cytomine-software-router.jar
RUN mkdir -p /software_router && \
    cd /software_router
ADD Cytomine-software-router.jar /software_router/Cytomine-software-router.jar
ADD log4j.properties /software_router/


RUN mkdir -p /root/.ssh

ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh

ENTRYPOINT ["/tmp/deploy.sh"]
