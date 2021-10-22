#!/bin/sh

PRE_TRANNING_MODEL_LINK_DEFAULT='http://download.tensorflow.org/models/object_detection/tf2/20200711/ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.tar.gz'
MODEL_NAME=$1
ROOT_FOLDER_NAME='TensorFlow'
CURRENT_DIR=$(pwd)
PRE_TRANNING_MODEL_LINK=$2

# check model name
if [ "$MODEL_NAME" = '' ]; then 
	echo 'Will use defalut model name'
	MODEL_NAME=$(echo $CURRENT_DIR| cut -d'/' -f 2)'_model'
	echo $MODEL_NAME
fi

# set pretraine model
if [ "$PRE_TRANNING_MODEL_LINK" = '' ]; then
	PRE_TRANNING_MODEL_LINK=$PRE_TRANNING_MODEL_LINK_DEFAULT
	echo 'The second argv was empty, use default link to pre-traine model:' $PRE_TRANNING_MODEL_LINK
fi

#sudo apt-get update & sudo apt-get upgrade


# create subdirs which was added to gitignore
mkdir -p $ROOT_FOLDER_NAME/addons \
		$ROOT_FOLDER_NAME/pre-trained-models \
		$ROOT_FOLDER_NAME/workspace/$MODEL_NAME

# Clone models example from repo
cd $ROOT_FOLDER_NAME
# if [ '$(echo $(pwd)| rev | cut -d"." -f1 | rev = $ROOT_FOLDER_NAME' ]; then
	# echo 'Good!!'
# fi

git clone https://github.com/tensorflow/models.git

#get file name of pre-traine model from link
PRE_TRAINE_MODEL_NAME=$(basename "$PRE_TRANNING_MODEL_LINK" ".tar.gz")

# download pre traine model
cd pre-trained-models/
wget $PRE_TRANNING_MODEL_LINK
echo "pre-traine model name: $PRE_TRAINE_MODEL_NAME was download"
tar -xvzf $PRE_TRAINE_MODEL_NAME.tar.gz

# move config file to new work dir
cp $PRE_TRAINE_MODEL_NAME/pipeline.config ../workspace/$MODEL_NAME