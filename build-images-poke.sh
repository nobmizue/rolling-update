#!/bin/bash

# Copyright 2014 The Kubernetes Authors All rights reserved.
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

# This script will build and push the images necessary for the demo.

set -o errexit
set -o nounset
set -o pipefail

REPO=gcr.io
#PROJECT=mizueplayground
PROJECT=mizueproject

set -x

docker build -t "${REPO}/${PROJECT}/update-demo:poke1" images/poke1
docker build -t "${REPO}/${PROJECT}/update-demo:poke2" images/poke2

#docker push "${REPO}/${PROJECT}/update-demo"
gcloud docker push ${REPO}/${PROJECT}/update-demo
