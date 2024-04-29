import json
import sys
import argparse


# Command line interface for this script to convert template to hyperparameters
# Options are provided to specify the input template file and the output hyperparameters file
# The input template file is a JSON file that contains the template for the hyperparameters
# In addition to the input and output files, the script also accepts an optional arguments to specify the name of the dataset


def convert_template_to_hyperparams(template, dataset , model , hpo_run_type, args):
    hyperparams = template.copy()

    # Iterate over the template and convert it to hyperparameters
 

# Set 
# [  
#    {
#           "name" : "model_outdir",
#           "type" : "constant",
#           "value" : "/candle_data_dir/outputs/IGTD/supervisor/CCLE"
#   },
#     {
#     "name" : "train_ml_data_dir",
#     "type" : "constant" ,
#     "value": "/candle_data_dir/outputs/IGTD/preprocess/CCLE"
#   },
#   {
#     "name" : "val_ml_data_dir",
#     "type" : "constant" ,
#     "value": "/candle_data_dir/outputs/IGTD/preprocess/CCLE"
#   },
#   {
#     "name" : "test_ml_data_dir",
#     "type" : "constant" ,
#     "value" : "/candle_data_dir/outputs/IGTD/preprocess/CCLE"
#   }
# ]


    model_outdir = {
        "name" : "model_outdir",
        "type" : "constant",
        "value" : "/candle_data_dir/outputs/" + model + "/supervisor/" + dataset + "/" + hpo_run_type
    }
    
    train_ml_data_dir = {
        "name" : "train_ml_data_dir",
        "type" : "constant" ,
        "value": "/candle_data_dir/outputs/" + model + "/preprocess/" + dataset
    }

    val_ml_data_dir = {
        "name" : "val_ml_data_dir",
        "type" : "constant" ,
        "value": "/candle_data_dir/outputs/" + model + "/preprocess/" + dataset
    }

    test_ml_data_dir = {
        "name" : "test_ml_data_dir",
        "type" : "constant" ,
        "value" : "/candle_data_dir/outputs/" + model + "/preprocess/" + dataset
    }

    hyperparams.append(model_outdir)
    hyperparams.append(train_ml_data_dir)
    hyperparams.append(val_ml_data_dir)
    hyperparams.append(test_ml_data_dir)

    for arg in args:
        key, value = arg.split('=')
        hyperparams.append({"name": key, "type": "constant", "value": value})



    print(hyperparams)

        
    return hyperparams

def main():
    parser = argparse.ArgumentParser(description='Convert template to hyperparameters')
    parser.add_argument('--template', type=str, help='Input template file', required=True , default="hyperparams.template.json")
    parser.add_argument('--hyperparams', type=str, help='Output hyperparameters file', required=True , default="hyperparams.json")
    parser.add_argument('--dataset', type=str, help='Name of the dataset', required=True)
    parser.add_argument('--model', type=str, help='Name of the model', required=True)
    parser.add_argument('--type', type=str, help='HPO run type', choices=['small', 'medium' , 'large'] , dest="hpo_run_type", default="DEFAULT" ,required=True)
    parser.add_argument('--args', type=str, nargs='*' , help='optional key=value', required=False , default=[])
    args = parser.parse_args()

    template_file = args.template
    hyperparams_file = args.hyperparams
    dataset = args.dataset
    model = args.model
    hpo_run_type = args.hpo_run_type
    args=args.args

    # Read the template file
    with open(template_file, 'r') as f:
        template = json.load(f)

    # Convert the template to hyperparameters
    hyperparams = convert_template_to_hyperparams(template, dataset, 
                                                  model, hpo_run_type, args)



    # Write the hyperparameters to the output file
    with open(hyperparams_file, 'w') as f:
        json.dump(hyperparams, f, indent=4)

    print(f'Hyperparameters written to {hyperparams_file}')



if __name__ == '__main__':
    main()
