#!/bin/bash

# Written by: tyak9569
# Date: 20201023
# Purpose: Hisat2 script for tyak9569

#SBATCH --partition=shas    # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=006:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=24           # Number of tasks per job  
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=hisat      # Job submission name
#SBATCH --output=hisat%j.out   # Output file name with Job ID


# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity/3.3.0
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER
outdirectory=/scratch/summit/tyak9569/dnFGFR/aligned/
mkdir -p $outdirectory

# Running HISAT2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file ${outdirectory}${filename}.txt -x /scratch/summit/tyak9569/dnFGFR/genome/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/${filename}_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/${filename}_trimmed.fq.gz -S ${outdirectory}${filename}.bam