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

model_item=ViT_base_patch16_384_ft
fp_item=fp16
bs_item=512
run_mode=DP8-MP1
device_num=N1C8
yaml_path=./task/classification/vit/configs/ViT_base_patch16_384_ft_in1k_1n8c_dp_fp16o2.yaml
max_iter=2501 # epoch=1
pretrained_model=./pretrained/ViT_base_patch16_224/imagenet2012-ViT-B_16-224

bash ./tests/test_tipc/classification/benchmark_common/prepare.sh
# run
bash ./tests/test_tipc/classification/benchmark_common/run_benchmark.sh ${model_item} ${fp_item} ${bs_item} ${run_mode} ${device_num} ${yaml_path} \
${max_iter} ${pretrained_model} 2>&1;
