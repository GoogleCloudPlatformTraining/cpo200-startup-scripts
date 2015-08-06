#!/bin/bash
#
# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# retrieve the IP address of your Cloud SQL instance
SQL_IP=$(curl \
"http://metadata/computeMetadata/v1/instance/\
attributes/sql-ip" \
-H "Metadata-Flavor: Google")

# retrieve the password of your Cloud SQL instance
SQL_PW=$(curl \
"http://metadata/computeMetadata/v1/instance/\
attributes/sql-pw" \
-H "Metadata-Flavor: Google")

docker run \
-e CLOUDSQL_IP=$SQL_IP \
-e CLOUDSQL_PWD=$SQL_PW \
-p 80:80 cpo200/guestbook
