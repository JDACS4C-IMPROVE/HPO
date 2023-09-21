source_cfg -v ${HPO_BASE_DIR}/tests/DRPreter/cfg-hpo-settings.sh

export CANDLE_MODEL_TYPE="SINGULARITY"
export MODEL_NAME=${HPO_IMAGE_DIR}/DRPreter.sif
export PARAM_SET_FILE=${HPO_BASE_DIR}/tests/DRPreter/cfg-hpo-parameter-space.json

export CANDLE_DATA_DIR=${HPO_DATA_DIR}/$(basname $MODEL_NAME .sif)
mkdir -p ${CANDLE_DATA_DIR}
