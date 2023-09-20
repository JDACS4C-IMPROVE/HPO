source_cfg -v ${BASE_DIR}/tests/DrugGCN/cfg-hpo-settings.sh

export CANDLE_MODEL_TYPE="SINGULARITY"
export MODEL_NAME=${IMAGE_PATH}/DrugGCN.sif
export PARAM_SET_FILE=/${BASE_DIR}/tests/DrugGCN/cfg-hpo-parameter-space.json

