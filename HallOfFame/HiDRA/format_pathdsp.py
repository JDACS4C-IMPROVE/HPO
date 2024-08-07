import csv
import glob
import os

def process_run_id(run_id):
    parts = run_id.split('_')
    iteration = parts[2].zfill(2)  # Ensure iteration is a two-digit string
    sample = parts[3].zfill(4)     # Ensure sample is a four-digit string
    return iteration, sample

def format_entry(iteration, sample, batch_size, learning_rate, metric, result, walltime):
    return (iteration, sample, batch_size, learning_rate, metric, result, walltime)

def process_files(base_dir):
    folders = glob.glob(os.path.join(base_dir, "*/MEDIUM/"))
    
    for folder in folders:
        data_entries = []
        files = glob.glob(os.path.join(folder, "output.csv"))
        print(f"Processing files in {folder}...")
        
        for file_path in files:
            with open(file_path, 'r') as in_csv:
                reader = csv.reader(in_csv)
                next(reader)  # Skip header row
                for row in reader:
                    train_ml_data_dir, val_ml_data_dir, model_outdir, batch_size, learning_rate, dropout, run_id, val_loss = row
                    iteration, sample = process_run_id(run_id)
                    entry = format_entry(iteration, sample, batch_size, learning_rate, 'val_loss', val_loss, 0)
                    data_entries.append(entry)
        
        # Sort entries by iteration and then by sample
        sorted_entries = sorted(data_entries, key=lambda x: (x[0], x[1]))
        output_file = os.path.join(folder, "hpo.csv")
        print(f"Wrote: {output_file}")
        write_output_file(sorted_entries, output_file)

def write_output_file(data_entries, output_file):
    with open(output_file, 'w', newline='') as out_csv:
        writer = csv.writer(out_csv)
        writer.writerow(['iteration', 'sample', 'batch_size', 'learning_rate', 'metric', 'result', 'walltime'])
        for entry in data_entries:
            writer.writerow(entry)

if __name__ == "__main__":
    base_dir = "./"
    process_files(base_dir)
    print("Data processed and written to hpo.csv files in each folder")
