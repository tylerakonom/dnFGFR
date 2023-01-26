#!/bin/bash

# Written by: tyak9569
# Date: 20201023
# Purpose: Hisat2 script for tyak9569

#SBATCH --partition=shas    # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=001:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=24           # Number of tasks per job  
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=hisat      # Job submission name
#SBATCH --output=hisat%j.out   # Output file name with Job ID


# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity
export SINGULARITY_TMPDIR=/gpfs/summit/scratch/$USER
export SINGULARITY_CACHEDIR=/gpfs/summit/scratch/$USER
outdirectory=/gpfs/summit/scratch/tyak9569/dnFGFR/aligned
indirectory=/gpfs/summit/scratch/tyak9569/dnFGFR/trimmedReads
mkdir -p ${outdirectory}
mkdir -p ${outdirectory}/hisatout

# Running HISAT2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file ${outdirectory}/hisatout/${filename}.txt -x /projects/tyak9569/dnFGFR/genome/GRCm38 -1 ${indirectory}/${filename}_1_trimmed.fq.gz -2 ${indirectory}/${filename}_2_trimmed.fq.gz -S ${outdirectory}/${filename}.bam