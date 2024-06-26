
set -e

MODEL=$1
DATASET=$2
TYPE=$3
PATH_TO_CONFIG=$4

DIR=`dirname $(readlink -f $0)`





CONFIG=${PATH_TO_CONFIG}/cfg-${MODEL}-${DATASET}-${TYPE}.sh
SETTINGS=${PATH_TO_CONFIG}/cfg-${TYPE}-settings.sh

if [ -f ${CONFIG} ]; then
    echo "Found existing Config, moving."
    mv ${CONFIG} ${CONFIG}.old
fi

# Create Hyperparams from template
echo "Creating Hyperparams"
echo "python ${DIR}/template2hyperparams.py --template ${PATH_TO_CONFIG}/hyperparams.template.json \
	    --hyperparams ${PATH_TO_CONFIG}/hyperparams.${MODEL}.${DATASET}.${TYPE}.json \
	        --dataset ${DATASET} \
		    --model ${MODEL} \
		        --type ${TYPE} \
			    --args ml_data_outdir=/candle_data_dir/outputs/${MODEL}/preprocess/${DATASET}"

python ${DIR}/template2hyperparams.py --template ${PATH_TO_CONFIG}/hyperparams.template.json \
    --hyperparams ${PATH_TO_CONFIG}/hyperparams.${MODEL}.${DATASET}.${TYPE}.json \
    --dataset ${DATASET} \
    --model ${MODEL} \
    --type ${TYPE} \
    --args ml_data_outdir=/candle_data_dir/outputs/${MODEL}/preprocess/${DATASET}

echo "Creating Config"
# Write to config file
echo "export MODEL=${MODEL}" > ${CONFIG}
echo source_cfg -v ${SETTINGS} >> ${CONFIG}
echo export CANDLE_MODEL_TYPE="SINGULARITY" >> ${CONFIG}
echo export MODEL_NAME=${HPO_IMAGE_DIR}/${MODEL}.sif >> ${CONFIG}
echo export PARAM_SET_FILE=${PATH_TO_CONFIG}/hyperparams.${MODEL}.${DATASET}.${TYPE}.json >> ${CONFIG}
