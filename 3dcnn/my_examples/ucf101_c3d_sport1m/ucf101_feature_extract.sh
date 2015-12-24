#!/bin/sh

# Directives
#PBS -N submit_interactive_job
#PBS -W group_list=yetidvmm
#PBS -q gpu
#PBS -l nodes=1,walltime=3:00:00:00,mem=8000mb,other=gpu:1
#PBS -M zs2262@columbia.edu
#PBS -m abe
#PBS -V

# Set output and error directories
#PBS -o localhost:/vega/dvmm/users/zhengshou/output_caffe/
#PBS -e localhost:/vega/dvmm/users/zhengshou/output_caffe/

GLOG_logtosterr=1 ../../build/tools/extract_image_features.bin c3d_ucf101_finetuning_feature_extract.prototxt ../conv3d_deepnetA_sport1m_iter_1900000 0 20 666 list_ucf101_uniform16_prefix.lst fc7-1  2> log_extract.txt

# 13320/20=666
