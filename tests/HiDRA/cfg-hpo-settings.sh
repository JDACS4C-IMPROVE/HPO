echo SETTINGS

# General Settings
export PROCS=4
export PPN=4
export WALLTIME=01:00:00
export NUM_ITERATIONS=3
export POPULATION_SIZE=2

# GA Settings
export GA_STRATEGY='mu_plus_lambda'
export OFFSPRING_PROPORTION=0.5
export MUT_PROB=0.8
export CX_PROB=0.2
export MUT_INDPB=0.5
export CX_INDPB=0.5
export TOURNSIZE=4

# Add any additional settings needed for your system. General settings and system settings need to be set by the user, while GA settings don't need to be changed.
# Default settings for lambda and polaris are given here.

# If you have write access to the shared filesystem on your computation system (such as /lambda_stor),
# you can save there. If not, make a directory in /tmp or somewhere else you can write.


if [ ! -z `hostname | grep lambda` ] 
then 
	echo Host Lambda
	# Lambda Settings
 	# export CANDLE_CUDA_OFFSET=2
	# TEST_DATA_DIR
elif [ ! -z `hostname | grep polaris` ] ; then
	echo Host Polaris
	# Polaris Settings
	export QUEUE="debug"
else
	echo Unknown system, no machine specific config
fi

echo CANDLE_DATA_DIR=${CANDLE_DATA_DIR}
