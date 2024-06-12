

set -xe

DIR=`dirname $(readlink -f $0)`
MODEL=Paccmann_MCA
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




#DATASOURCES="gCSI CCLE GDSCv2 GDSCv1 CTRPv2"
DATASOURCES="CCLE GDSCv1 GDSCv2 CTRPv2"
 for TYPE in medium; do
    for d in ${DATASOURCES} ; do
        sh ${DIR}/Paccmann-hpo-config.sh $MODEL $d ${TYPE} ${EXPERIMENT_DIR}/configs/${MODEL}
        current_dir=$(pwd)
        cd ${EXPERIMENT_DIR}
	# time supervisor conda GA configs/$MODEL/cfg-${MODEL}-${d}-${TYPE}.sh
        time supervisor polaris GA configs/$MODEL/cfg-${MODEL}-${d}-${TYPE}.sh 
        cd $current_dir
    done

done
