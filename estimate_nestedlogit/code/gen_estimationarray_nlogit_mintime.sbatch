#!/bin/sh

#SBATCH --job-name=estarraynlogit_mintime
#SBATCH --output=slurmlogs/estarraynlogit_mintime_job_%A_%a.out
#SBATCH --error=slurmlogs/estarraynlogit_mintime_job_%A_%a.err
#SBATCH --array=1-6
#SBATCH --partition=covert-dingel
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=50g
#SBATCH --mail-type=END,FAIL

######################
# Begin work section #
######################

list_race[1]=black
list_nest[1]=1

list_race+=(black asian asian whithisp whithisp)
list_nest+=(2 1 2 1 2)

module load julia/0.6.2
julia gen_estimationarray_nlogit_calls.jl "${list_race[$SLURM_ARRAY_TASK_ID]}" "${list_nest[$SLURM_ARRAY_TASK_ID]}" mintime
