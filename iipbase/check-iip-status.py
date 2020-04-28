#!/bin/python
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

import subprocess

output = subprocess.check_output(["/usr/sbin/service", "iip", "status"])

nb_iip = output.count("/usr/local/httpd/fcgi-bin/iipsrv.fcgi")

print "output %s " % output
print nb_iip

if nb_iip < NB_IIP_PROCESS:
	print "Restart IIP Service"
	subprocess.call(["/usr/sbin/service", "iip", "stop"])
	subprocess.call(["/usr/sbin/service", "iip", "start"])

