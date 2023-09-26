source_cfg -v tests/tCNNS/cfg-hpo-settings.sh

export CANDLE_MODEL_TYPE="SINGULARITY"
export MODEL_NAME=${IMAGE_PATH}/tCNNS.sif
export PARAM_SET_FILE=tests/tCNNS/hpo-parameter-space.json

