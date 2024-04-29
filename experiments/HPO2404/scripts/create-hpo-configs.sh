

set -xe

DIR=`dirname $(readlink -f $0)`
MODEL=$1
HPO_EXPERIMENT=HPO2404
IMAGE=${HPO_IMAGE_DIR}/${MODEL}.sif
EXPERIMENT_DIR=${HPO_BASE_DIR}/experiments/${HPO_EXPERIMENT}
CONFIG_DIR=${HPO_BASE_DIR}/configs/${MODEL}
OUTPUT_DIR=${EXPERIMENT_DIR}/outputs/${MODEL}
RAW_DATA_DIR=${EXPERIMENT_DIR}/raw_data/


IMPROVE_DATA_DIR=${EXPERIMENT_DIR}

CANDLE_BASE_DIR=/candle_data_dir
CANDLE_INPUT_DIR=${CANDLE_BASE_DIR}/raw_data
# CANDLE_OUTDIR=${CANDLE_BASE_DIR}/outputs/${MODEL}/preprocess/${DATASET}




DATASOURCES="gCSI CCLE CTRPv2 GDSCv1 GDSCv2"
for d in ${DATASOURCES} ; do

    for TYPE in small medium large ; do
        sh ${DIR}/hpo.sh $MODEL $d ${TYPE} ${EXPERIMENT_DIR}/configs/${MODEL}
    done

done