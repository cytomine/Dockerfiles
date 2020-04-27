#!/bin/bash
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


bash /tmp/addHosts.sh


cd /software_router/algo/
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/classification_model_builder .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/classification_prediction .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/classification_validation .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-datamining .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/detect_sample .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/export_landmark .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/landmark_model_builder .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/landmark_prediction .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/object_finder .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/segmentation_model_builder .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/segmentation_prediction .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/ldm_model_builder .
cp -R /root/Cytomine/Cytomine-python-datamining/cytomine-applications/ldm_prediction .



#mkdir -p /software_router/algo/simple_elastix
#mv /tmp/get_and_move.py /software_router/algo/simple_elastix/get_and_move.py

cp -R /root/Cytomine/Cytomine-tools/computeAnnotationStats .
cp /root/Cytomine/Cytomine-tools/computeTermArea.groovy .
mkdir ../lib
cp -R /root/Cytomine/Cytomine-tools/jars ../lib
cp /root/Cytomine/Cytomine-tools/union4.groovy ../lib

cd /software_router/
mv cytomine-java-client.jar lib/jars/Cytomine-client-java.jar
mv /tmp/injectSoftware.groovy .

# horrible hack for groovy with dash
PATH="$PATH:$GROOVY_HOME/bin:/root/anaconda/bin"


groovy -cp 'lib/jars/Cytomine-client-java.jar' injectSoftware.groovy $CORE_URL $RABBITMQ_PUB_KEY $RABBITMQ_PRIV_KEY


touch /tmp/test.out

java -jar Cytomine-software-router.jar > /tmp/test.out &

bash wrapdocker #&& service docker start


tail -f /tmp/test.out
