
# GraphDRP Hyperparameter Search - Test "small"
# These parameters should stay small for short tests
#       and use no dense parameters to avoid mlrMBO crashes

# see https://cran.r-project.org/web/packages/ParamHelpers/ParamHelpers.pdfmakeNum
# the parameter names should match names of the arguments expected by the benchmark

param.set <- makeParamSet(
  makeIntegerParam("epochs", lower = 1, upper = 1),
  makeIntegerParam("batch_size" , lower = 8 , upper = 2048 ),
  makeNumericParam("learning_rate", lower = 0.000001, upper = 0.1)
)
