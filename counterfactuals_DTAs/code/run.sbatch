#!/bin/sh

#SBATCH --job-name=counterfactuals_DTAs
#SBATCH --partition=covert-dingel
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=2g
#SBATCH --mail-type=END,FAIL

module load stata
stata-se -e counterfactuals_DTAs.do
