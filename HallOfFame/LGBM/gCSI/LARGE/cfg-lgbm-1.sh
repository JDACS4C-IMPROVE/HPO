
# CFG LGBM TEST

export CANDLE_MODEL_TYPE="SINGULARITY"
export MODEL_NAME=/software/improve/images/lgbm_0.6.0.sif  #Lambda

export PARAM_SET_FILE=lgbm_param_space-1.json

export FRAMEWORK="keras"
export PROCS=12

# MEDIUM:
# export POPULATION_SIZE=16
# export NUM_ITERATIONS=4

# LARGE:
export POPULATION_SIZE=80
export NUM_ITERATIONS=10
