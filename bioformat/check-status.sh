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

COUNT=$(ps aux | grep "java -jar /tmp/cytomine-bioformats-wrapper.jar" | grep -v grep | wc -l)
if [ $COUNT -lt 1 ]; then
    echo "$COUNT / 1 on $(date)"
    java -jar /tmp/cytomine-bioformats-wrapper.jar $1 > /tmp/log &
fi;
