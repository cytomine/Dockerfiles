#!/bin/bash
#
# Copyright (c) 2009-2017. Authors: see NOTICE file.
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

mkdir -p /tmp/uploaded && chmod 777 /tmp/uploaded

echo "/usr/local/nginx/logs/access.log {"   > /etc/logrotate.d/nginx
echo "  copytruncate"                      >> /etc/logrotate.d/nginx
echo "  daily"                             >> /etc/logrotate.d/nginx
echo "  size 250M"                         >> /etc/logrotate.d/nginx
echo "  rotate 14"                         >> /etc/logrotate.d/nginx
echo "  compress"                          >> /etc/logrotate.d/nginx
echo "  missingok"                         >> /etc/logrotate.d/nginx
echo "  create 640 root root"              >> /etc/logrotate.d/nginx
echo "}"                                   >> /etc/logrotate.d/nginx
echo ""                                    >> /etc/logrotate.d/nginx
echo "/usr/local/nginx/logs/error.log {"   >> /etc/logrotate.d/nginx
echo "  copytruncate"                      >> /etc/logrotate.d/nginx
echo "  daily"                             >> /etc/logrotate.d/nginx
echo "  size 250M"                         >> /etc/logrotate.d/nginx
echo "  rotate 14"                         >> /etc/logrotate.d/nginx
echo "  compress"                          >> /etc/logrotate.d/nginx
echo "  missingok"                         >> /etc/logrotate.d/nginx
echo "  create 640 root root"              >> /etc/logrotate.d/nginx
echo "}"                                   >> /etc/logrotate.d/nginx


echo "Launch of nginx"
/usr/local/nginx/sbin/nginx
echo "End of the deployment"

tail -F /usr/local/nginx/logs/access.log
