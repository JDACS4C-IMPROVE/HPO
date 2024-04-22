source_cfg -v /homes/wilke/IMPROVE/HPO/experiments/HPO2404/configs/${MODEL}/cfg-large-settings.sh

export CANDLE_MODEL_TYPE="SINGULARITY"
export MODEL_NAME=${HPO_IMAGE_DIR}/${MODEL}.sif
export PARAM_SET_FILE=/homes/wilke/IMPROVE/HPO/experiments/HPO2404/configs/${MODEL}/hyperparams.json
