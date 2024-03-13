
# CFG GraphDRP TEST

export CANDLE_MODEL_TYPE="SINGULARITY"
export MODEL_NAME=/software/improve/images/GraphDRP.sif  #Lambda

export PARAM_SET_FILE=hyperparams.json

export FRAMEWORK="keras"


export WALLTIME=72:00:00

# SMALL:
export PROCS=3
export POPULATION_SIZE=4
export NUM_ITERATIONS=3

# MEDIUM:
# export POPULATION_SIZE=16
# export NUM_ITERATIONS=4

# LARGE:
# export POPULATION_SIZE=80
# export NUM_ITERATIONS=10