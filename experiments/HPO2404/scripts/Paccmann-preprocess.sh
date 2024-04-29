
set -xe

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




DATASOURCES="gCSI CCLE CTRPv2 GDSCv1 GDSCv2"
for d in ${DATASOURCES}
do
	CANDLE_OUTDIR=${CANDLE_BASE_DIR}/outputs/${MODEL}/preprocess/${d}
	CANDLE_RAW_DATA_DIR=${CANDLE_BASE_DIR}/raw_data/
	echo $d ${CANDLE_OUTDIR}
	time singularity run -B ${EXPERIMENT_DIR}:${CANDLE_BASE_DIR} \
	       ${IMAGE}	\
	       preprocess.sh ${CANDLE_BASE_DIR} \
	       		--raw_data_dir ${CANDLE_RAW_DATA_DIR} \
			--ml_data_outdir ${CANDLE_OUTDIR} \
			--train_split_file ${d}_split_0_train.txt \
			--val_split_file ${d}_split_0_val.txt \
			--test_split_file ${d}_split_0_test.txt
done
