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

FROM cytomine/iipbase:v1.2.0

MAINTAINER Cytomine SCRLFS "support@cytomine.coop"

#IIP Image Server
RUN apt-get -y update && apt-get -y install cmake
RUN cd /tmp && git clone https://github.com/uclouvain/openjpeg && cd openjpeg/ && mkdir build && cd build/ && cmake .. -DCMAKE_BUILD_TYPE=Release && make && make install && make clean
RUN cd /tmp && git clone https://github.com/ruven/iipsrv && cd /tmp/iipsrv && git checkout 0295612efc0592c13e8765cd14f7d343d32b1dc0 && sh autogen.sh && ./configure && make 
RUN mkdir -p /usr/local/httpd/fcgi-bin && cp /tmp/iipsrv/src/iipsrv.fcgi /usr/local/httpd/fcgi-bin/iipsrv.fcgi

RUN ldconfig -v

ENTRYPOINT ["/tmp/deploy.sh"]

