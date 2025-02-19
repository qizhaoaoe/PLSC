# Copyright (c) 2022 PaddlePaddle Authors. All Rights Reserved.
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

unset http_proxy https_proxy
python -m pip install -r requirements.txt --force-reinstall
python -m pip install protobuf==3.20 --force-reinstall
python setup.py develop

# dataset
mkdir dataset && cd dataset
cp -r ${BENCHMARK_ROOT}/models_data_cfs/Paddle_distributed/MS1M_v3.tgz ./
tar -zxf MS1M_v3.tgz
cd -
