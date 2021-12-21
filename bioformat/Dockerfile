# Copyright (c) 2009-2019. Authors: see NOTICE file.
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

ARG FROM_NAMESPACE
ARG FROM_VERSION
FROM ${FROM_NAMESPACE}/java8:$FROM_VERSION

ENV BIOFORMAT_PORT 4321

RUN apt-get -y update && \
    apt-get install -y \
      cron \
      rsyslog && \
    rm -rf /var/lib/apt/lists/*

ARG VERSION
ARG NAMESPACE=Cytomine-ULiege
ARG RELEASE_PATH=https://github.com/${NAMESPACE}/Cytomine-BioFormats/releases/download/v${VERSION}
ADD ${RELEASE_PATH}/cytomine-bioformats-wrapper.jar /tmp/cytomine-bioformats-wrapper.jar
RUN chmod +x /tmp/cytomine-bioformats-wrapper.jar

COPY check-status.sh /tmp/check-status.sh
RUN chmod +x /tmp/check-status.sh

COPY deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh

ENTRYPOINT ["/tmp/deploy.sh"]

