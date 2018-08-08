#!/bin/bash

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

cd /software_router/
mv /tmp/config.groovy .

echo "cytomine.core.url='http://$CORE_URL'" >> config.groovy
echo "cytomine.core.publicKey='$RABBITMQ_PUB_KEY'" >> config.groovy
echo "cytomine.core.privateKey='$RABBITMQ_PRIV_KEY'" >> config.groovy
echo "rabbitmq.username='$RABBITMQ_LOGIN'" >> config.groovy
echo "rabbitmq.password='$RABBITMQ_PASSWORD'" >> config.groovy
echo "groovyPath='$GROOVY_PATH'" >> config.groovy

echo "cytomine.software.path.softwareSources='$SOFTWARE_CODE_PATH'" >> config.groovy
echo "cytomine.software.path.softwareImages='$SOFTWARE_DOCKER_IMAGES_PATH'" >> config.groovy
echo "cytomine.software.jobs='$JOBS_PATH'" >> config.groovy
echo "cytomine.software.sshKeysFile='/root/.ssh/id_rsa'" >> config.groovy

touch /tmp/log.out

java -jar Cytomine-software-router.jar > /tmp/log.out &

tail -f /tmp/log.out
