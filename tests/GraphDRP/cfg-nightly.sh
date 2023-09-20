source_cfg -v ${BASE_DIR}/tests/GraphDRP/cfg-graphdrp-hpo-settings.sh

export CANDLE_MODEL_TYPE="SINGULARITY"
export MODEL_NAME=${IMAGE_PATH}/GraphDRP.sif
export PARAM_SET_FILE=${BASE_DIR}/tests/GraphDRP/hpo-parameter-space.json

