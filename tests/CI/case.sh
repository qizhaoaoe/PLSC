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

#!/usr/bin/env bash
set -e

export plsc_path=/paddle/PLSC/tests/CI
export log_path=/paddle/log_plsc
plsc_gpu_model_list=( \
    IResNet50_MS1MV3_ArcFace_pfc10_1n8c_dp_mp_fp16o1 \
    FaceViT_tiny_patch9_112_WebFace42M_CosFace_pfc10_droppath005_mask0_1n8c_dp_mp_fp16o1 \
    FaceViT_tiny_patch9_112_WebFace42M_CosFace_pfc02_droppath005_mask0_1n8c_dp_mp_fp16o1 \
    FaceViT_base_patch9_112_WebFace42M_CosFace_pfc03_droppath005_mask005_1n8c_dp_mp_fp16o1 \
    IResNet100_WebFace42M_CosFace_pfc02_1n8c_dp_mp_fp16o1 \
    IResNet50_MS1MV3_ArcFace_pfc01_1n1c_fp16o1 \
    IResNet50_MS1MV3_ArcFace_pfc01_1n8c_dp8_fp16o1 \
    ViT_base_patch16_224_in1k_1n8c_dp_fp16o2 \
    ViT_base_patch16_384_ft_in1k_1n8c_dp_fp16o2 \
    DeiT_base_patch16_224_in1k_1n8c_dp_fp32 \
    DeiT_base_patch16_224_in1k_1n8c_dp_fp16o2 \
    cait_s24_224_in1k_1n8c_dp_fp16o2 \
    swin_base_patch4_window7_224_fp16o2 \
    mae_vit_base_patch16_pt_in1k_1n8c_dp_fp16o1 \
    mae_vit_base_patch16_ft_in1k_1n8c_dp_fp16o1 \
    mae_vit_base_patch16_lp_in1k_1n8c_dp_fp16o1 \
    convmae_convvit_base_patch16_pt_in1k_1n8c_dp_fp16o1 \
    convmae_convvit_base_patch16_ft_in1k_1n8c_dp_fp16o1 \
    convmae_convvit_base_patch16_lp_in1k_1n8c_dp_fp16o1 \
    ConvNeXt_base_224_in1k_1n8c_dp_fp32 \
)

###### Face ######
function IResNet50_MS1MV3_ArcFace_pfc10_1n8c_dp_mp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./recognition/face/IResNet50_MS1MV3_ArcFace_pfc10_1n8c_dp_mp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/5059" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 44.48089 ${loss%?} 4833.4825 ${ips} $FUNCNAME
}

function IResNet100_WebFace42M_CosFace_pfc02_1n8c_dp_mp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./recognition/face/IResNet100_WebFace42M_CosFace_pfc02_1n8c_dp_mp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/40465" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 41.22209 ${loss%?} 419.58025 ${ips} $FUNCNAME
}

function FaceViT_tiny_patch9_112_WebFace42M_CosFace_pfc10_droppath005_mask0_1n8c_dp_mp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./recognition/face/FaceViT_tiny_patch9_112_WebFace42M_CosFace_pfc10_droppath005_mask0_1n8c_dp_mp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/2530" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 38.36626 ${loss%?} 9247.1 ${ips} $FUNCNAME
}

function FaceViT_tiny_patch9_112_WebFace42M_CosFace_pfc02_droppath005_mask0_1n8c_dp_mp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./recognition/face/FaceViT_tiny_patch9_112_WebFace42M_CosFace_pfc02_droppath005_mask0_1n8c_dp_mp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/2530" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 37.72493 ${loss%?} 8745.6225 ${ips} $FUNCNAME
}

function FaceViT_base_patch9_112_WebFace42M_CosFace_pfc03_droppath005_mask005_1n8c_dp_mp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./recognition/face/FaceViT_base_patch9_112_WebFace42M_CosFace_pfc03_droppath005_mask005_1n8c_dp_mp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/5059" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 38.86843 ${loss%?} 2272.975 ${ips} $FUNCNAME
}

function IResNet50_MS1MV3_ArcFace_pfc01_1n1c_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./recognition/face/IResNet50_MS1MV3_ArcFace_pfc01_1n1c_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/40465" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 46.32475 ${loss%?} 621.917 ${ips} $FUNCNAME
}

function IResNet50_MS1MV3_ArcFace_pfc01_1n8c_dp8_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./recognition/face/IResNet50_MS1MV3_ArcFace_pfc01_1n8c_dp8_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/5059" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 41.84674 ${loss%?} 4613.785 ${ips} $FUNCNAME
}

#function MobileFaceNet_WebFace42M_CosFace_pfc02_1n8c_dp_mp_fp16o1() {
#    cd ${plsc_path}
#    rm -rf log
#    bash ./recognition/face/MobileFaceNet_WebFace42M_CosFace_pfc02_1n8c_dp_mp_fp16o1.sh
##    loss=`tail log/workerlog.0 | grep "199/20233" | cut -d " " -f12 `
#    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
#    check_result 42.17661 ${loss%?} ${FUNCNAME}_loss ${ips} $FUNCNAME
#}

###### ViT ######
function ViT_base_patch16_224_in1k_1n8c_dp_fp16o2() {
    cd ${plsc_path}
    rm -rf log
    bash ./classification/vit/ViT_base_patch16_224_in1k_1n8c_dp_fp16o2.sh
    loss=`tail log/workerlog.0 | grep "49/313" | cut -d " " -f18 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f24 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 10.47853 ${loss%?} 2140.74 ${ips} $FUNCNAME
}

function ViT_base_patch16_384_ft_in1k_1n8c_dp_fp16o2() {
    cd ${plsc_path}
    rm -rf log
    bash ./classification/vit/ViT_base_patch16_384_ft_in1k_1n8c_dp_fp16o2.sh
    loss=`tail log/workerlog.0 | grep "49/2502" | cut -d " " -f18 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f24 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.90351 ${loss%?} 420.1 ${ips} $FUNCNAME
}


###### DeiT ######
function DeiT_base_patch16_224_in1k_1n8c_dp_fp32() {
    cd ${plsc_path}
    rm -rf log
    bash ./classification/deit/DeiT_base_patch16_224_in1k_1n8c_dp_fp32.sh
    loss=`tail log/workerlog.0 | grep "49/1251" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.90003 ${loss%?} 783.895 ${ips} $FUNCNAME
}


function DeiT_base_patch16_224_in1k_1n8c_dp_fp16o2() {
    cd ${plsc_path}
    rm -rf log
    bash ./classification/deit/DeiT_base_patch16_224_in1k_1n8c_dp_fp16o2.sh
    loss=`tail log/workerlog.0 | grep "49/1251" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.90155 ${loss%?} 2079.68 ${ips} $FUNCNAME
}


###### CaiT ######
function cait_s24_224_in1k_1n8c_dp_fp16o2() {
    cd ${plsc_path}
    rm -rf log
    bash ./classification/cait/cait_s24_224_in1k_1n8c_dp_fp16o2.sh
    loss=`tail log/workerlog.0 | grep "49/1251" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.93708 ${loss%?} 1824.29 ${ips} $FUNCNAME
}


###### Swin ######
function swin_base_patch4_window7_224_fp16o2() {
    cd ${plsc_path}
    rm -rf log
    bash ./classification/swin/swin_base_patch4_window7_224_fp16o2.sh
    loss=`tail log/workerlog.0 | grep "49/1252" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 7.06612 ${loss%?} 944.051 ${ips} $FUNCNAME
}


###### MAE ######
function mae_vit_base_patch16_pt_in1k_1n8c_dp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./ssl/mae/mae_vit_base_patch16_pt_in1k_1n8c_dp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/1251" | cut -d " " -f15 `
    ips=`cat log/workerlog.0 |grep time: |awk -F: '{print $10}' |cut -d " " -f2|awk 'NR>20 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 1.0064 ${loss} 0.4965 ${ips} $FUNCNAME
}


function mae_vit_base_patch16_ft_in1k_1n8c_dp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./ssl/mae/mae_vit_base_patch16_ft_in1k_1n8c_dp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "599/5004" | cut -d " " -f15 `
    ips=`cat log/workerlog.0 |grep time: |awk -F: '{print $10}' |cut -d " " -f2|awk 'NR>20 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.7559 ${loss} 0.2332 ${ips} $FUNCNAME
}


function mae_vit_base_patch16_lp_in1k_1n8c_dp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./ssl/mae/mae_vit_base_patch16_lp_in1k_1n8c_dp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/312" | cut -d " " -f14 `
    ips=`cat log/workerlog.0 |grep time: |awk -F: '{print $10}' |cut -d " " -f2|awk 'NR>20 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.6991 ${loss} 1.1039 ${ips} $FUNCNAME
}


###### ConvMAE ######
function convmae_convvit_base_patch16_pt_in1k_1n8c_dp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./ssl/convmae/convmae_convvit_base_patch16_pt_in1k_1n8c_dp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "99/1251" | cut -d " " -f16 `
    ips=`cat log/workerlog.0 |grep time: |awk -F: '{print $10}' |cut -d " " -f2|awk 'NR>20 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 1.2954 ${loss} 0.8568 ${ips} $FUNCNAME
}


function convmae_convvit_base_patch16_ft_in1k_1n8c_dp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./ssl/convmae/convmae_convvit_base_patch16_ft_in1k_1n8c_dp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "599/5004" | cut -d " " -f15 `
    ips=`cat log/workerlog.0 |grep time: |awk -F: '{print $10}' |cut -d " " -f2|awk 'NR>20 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.7890 ${loss} 0.2964 ${ips} $FUNCNAME
}


function convmae_convvit_base_patch16_lp_in1k_1n8c_dp_fp16o1() {
    cd ${plsc_path}
    rm -rf log
    bash ./ssl/convmae/convmae_convvit_base_patch16_lp_in1k_1n8c_dp_fp16o1.sh
    loss=`tail log/workerlog.0 | grep "199/1251" | cut -d " " -f15 `
    ips=`cat log/workerlog.0 |grep time: |awk -F: '{print $10}' |cut -d " " -f2|awk 'NR>20 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.9417 ${loss} 0.3474 ${ips} $FUNCNAME
}

function ConvNeXt_base_224_in1k_1n8c_dp_fp32() {
    cd ${plsc_path}
    rm -rf log
    bash ./classification/convnext/ConvNeXt_base_224_in1k_1n8c_dp_fp32.sh
    loss=`tail log/workerlog.0 | grep "50/313" | cut -d " " -f12 `
    ips=`cat log/workerlog.0 |grep ips: |cut -d " " -f18 |awk 'NR>1 {print}' | awk '{a+=$1}END{print a/NR}'`
    check_result 6.91451 ${loss%?} 706.8508 ${ips} $FUNCNAME
}

function check_result() {
    if [ $? -ne 0 ];then
      echo -e "\033 $5 model runs failed! \033" | tee -a $log_path/result.log
      exit -1
    fi

    echo -e "loss_base: $1 loss_test: $2" | tee -a $log_path/result.log
    if [ $1 != $2 ];then
      echo -e "\033 $5 loss diff check failed! \033" | tee -a $log_path/result.log
      exit -1
    fi

    diff=$(echo $3 $4|awk '{printf "%0.2f\n", ($2-$1)/$1*100}')
    echo -e "ips_base: $3 ips_test: $4 ips_diff: $diff% " | tee -a $log_path/result.log
    v1=$(echo $diff 5.0|awk '{print($1>=$2)?"0":"1"}')
    v2=$(echo $diff -5.0|awk '{print($1<=$2)?"0":"1"}')
    if [[ $v1 == 0 ]] || [[ $v2 == 0 ]];then
      echo -e "\033 $5 ips diff check failed! \033" | tee -a $log_path/result.log
      exit -1
    fi
}

function run_gpu_models(){
    cd
      for model in ${plsc_gpu_model_list[@]}
      do
        echo "=========== ${model} run begin ==========="
        $model
        echo "=========== ${model} run  end ==========="
      done
}

main() {
    run_gpu_models
}

main$@
