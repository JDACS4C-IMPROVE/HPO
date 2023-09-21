# HPO
Setup and configs for HPO runs

## Setup

Create global config file:

```bash
git clone
cd HPO
./setup
source config/hpo.env
```

This will create an hpo.env file in the config folder and source the environment. 

The setup script has the following additionl options:
1. `-d` : Path to global data directory
2. `-i` : Path to container image directory
3. `-b` : Path to this repository

**Example**

1. We are using images from the Singularity repository. The data directory is within the HPO directory.
```bash
mkdir data_dir
./setup -b `pwd` -i ../Singularity/build -d `pwd`/data_dir
```
