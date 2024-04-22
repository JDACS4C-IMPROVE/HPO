
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
	CANDLE_INPUT_DIR=${CANDLE_BASE_DIR}/outputs/${MODEL}/preprocess/${d}
	# CANDLE_RAW_DATA_DIR=${CANDLE_BASE_DIR}/raw_data/
	CANDLE_MODEL_DIR=${CANDLE_BASE_DIR}/outputs/${MODEL}/train/${d}
	CANDLE_OUTPUT_DIR=${CANDLE_MODEL_DIR}
	GPU_ID=0
	echo $d ${CANDLE_OUTDIR}
	time singularity run --nv -B ${EXPERIMENT_DIR}:${CANDLE_BASE_DIR} \
	       ${IMAGE}	\
	       train.sh ${GPU_ID} ${CANDLE_BASE_DIR} \
	       		--model_outdir ${CANDLE_OUTPUT_DIR} \
			--ml_data_outdir ${CANDLE_INPUT_DIR} \
			--train_ml_data_dir ${CANDLE_INPUT_DIR} \
			--test_ml_data_dir ${CANDLE_INPUT_DIR} \
			--val_ml_data_dir ${CANDLE_INPUT_DIR} \
			--epochs 1 \
			--learning_rate 0.001 
done
