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

FROM python:3

MAINTAINER Cytomine Team "support@cytomine.be"

RUN apt-get update -y && apt-get install -y libgeos-dev

RUN git clone https://github.com/cytomine/Cytomine-python-client.git &&     cd Cytomine-python-client &&     git checkout v2.2.1 &&     python setup.py build &&     python setup.py install


