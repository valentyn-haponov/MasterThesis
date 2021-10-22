#!/bin/sh

ANCONDA_LINK='https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh'
PROTOBUF_LINK='https://github.com/protocolbuffers/protobuf/releases/download/v3.19.0/protobuf-all-3.19.0.tar.gz'
CONDA_NAME_SH='Anaconda-latest-Linux-x86_64.sh'
USER_NAME=$1

CURRENT_DIR=$(pwd)


echo $CURRENT_DIR
echo $USER_NAME
echo $ANCONDA_LINK

# Please check how changed dir, where conda will be install

wget $ANCONDA_LINK
chmod +x $CONDA_NAME_SH
bash $CONDA_NAME_SH

conda init finish
conda update conda

# After conda intalled
#   - Activate venv if it is neccessary
#     conda create -n tensorflow pip python=3.9
#   - Install pip tensor flow 
#     pip install --ignore-installed --upgrade tensorflow==2.5.0
#     Verify cmd: python -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

# TODO 
# GPU supported
#      ...

# Protobuf Installation
wget $PROTOBUF_LINK

# add path to env

# COCO API installation

# git clone https://github.com/cocodataset/cocoapi.git
# cd cocoapi/PythonAPI
# make
# cp -r pycocotools <PATH_TO_TF>/TensorFlow/models/research/