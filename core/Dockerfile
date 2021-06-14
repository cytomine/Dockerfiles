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

FROM tomcat:9.0.46-jdk8-openjdk

MAINTAINER Cytomine SCRLFS "support@cytomine.coop"

RUN cd /usr/local/tomcat/webapps/  && wget https://github.com/cytomine/Cytomine-core/releases/download/v3.0.4/Core.war -O ROOT.war
RUN cd /usr/local/tomcat/  && wget https://github.com/cytomine/Cytomine-core/releases/download/v3.0.4/restapidoc.json -O restapidoc.json

RUN mkdir -p /usr/share/tomcat9/.grails

RUN touch /tmp/addHosts.sh
ADD setenv.sh /tmp/setenv.sh
RUN chmod +x /tmp/setenv.sh
ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh

ENTRYPOINT ["/tmp/deploy.sh"]
