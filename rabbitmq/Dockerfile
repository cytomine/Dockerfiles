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

RUN apt-get install curl gnupg debian-keyring debian-archive-keyring apt-transport-https -y

## Team RabbitMQ's main signing key
RUN apt-key adv --keyserver "hkps://keys.openpgp.org" --recv-keys "0x0A9AF2115F4687BD29803A206B73A36E6026DFCA"
## Cloudsmith: modern Erlang repository
RUN curl -1sLf https://dl.cloudsmith.io/public/rabbitmq/rabbitmq-erlang/gpg.E495BB49CC4BBE5B.key | apt-key add -
## Cloudsmith: RabbitMQ repository
RUN curl -1sLf https://dl.cloudsmith.io/public/rabbitmq/rabbitmq-server/gpg.9F4587F226208342.key | apt-key add -

## Add apt repositories maintained by Team RabbitMQ
RUN echo '## Provides modern Erlang/OTP releases' > /etc/apt/sources.list.d/rabbitmq.list
RUN echo '##' >> /etc/apt/sources.list.d/rabbitmq.list      
RUN echo 'deb https://dl.cloudsmith.io/public/rabbitmq/rabbitmq-erlang/deb/ubuntu bionic main' >> /etc/apt/sources.list.d/rabbitmq.list
RUN echo 'deb-src https://dl.cloudsmith.io/public/rabbitmq/rabbitmq-erlang/deb/ubuntu bionic main' >> /etc/apt/sources.list.d/rabbitmq.list

RUN echo '## Provides RabbitMQ' >> /etc/apt/sources.list.d/rabbitmq.list
RUN echo '##' >> /etc/apt/sources.list.d/rabbitmq.list
RUN echo 'deb https://dl.cloudsmith.io/public/rabbitmq/rabbitmq-server/deb/ubuntu bionic main' >> /etc/apt/sources.list.d/rabbitmq.list
RUN echo 'deb-src https://dl.cloudsmith.io/public/rabbitmq/rabbitmq-server/deb/ubuntu bionic main' >> /etc/apt/sources.list.d/rabbitmq.list


## Update package indices
RUN apt-get update -y

## Install Erlang packages
RUN apt-get install -y erlang-base \
                        erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
                        erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
                        erlang-runtime-tools erlang-snmp erlang-ssl \
                        erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl

## Install rabbitmq-server and its dependencies
RUN apt-get install rabbitmq-server -y 


ADD run.sh /run.sh
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh
RUN chmod 755 ./*.sh

EXPOSE 5672 15672
ENTRYPOINT ["/run.sh"]
