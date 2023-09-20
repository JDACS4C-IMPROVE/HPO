source_cfg -v ${BASE_DIR}/tests/Paccmann_MCA/cfg-hpo-settings.sh

export CANDLE_MODEL_TYPE="SINGULARITY"
export MODEL_NAME=${IMAGE_PATH}/Paccmann_MCA.sif
export PARAM_SET_FILE=${BASE_DIR}tests/Paccmann_MCA/cfg-hpo-parameter-space.json

