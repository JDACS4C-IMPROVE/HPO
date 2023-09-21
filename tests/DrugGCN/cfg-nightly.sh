
export MODEL_NAME=${HPO_IMAGE_DIR}/DrugGCN.sif

MODEL=$(basname $MODEL_NAME .sif)

source_cfg -v ${HPO_BASE_DIR}/tests/${MODEL}/cfg-hpo-settings.sh
export CANDLE_MODEL_TYPE="SINGULARITY"
export PARAM_SET_FILE=${HPO_BASE_DIR}/tests/${MODEL}/cfg-hpo-parameter-space.json
export CANDLE_DATA_DIR=${HPO_DATA_DIR}/${MODEL}

mkdir -p ${CANDLE_DATA_DIR}
