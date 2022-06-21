#!/bin/bash

# Written by: tyak9569
# Date: 20201027
# Purpose: samtools sort script for tyak9569

#SBATCH --partition=smem    # Summit partition, this may need to be smem
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=002:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=4           # Number of tasks per job  
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --mem=110gb           # Memory Allocated, hopefully there's enough here
#SBATCH --job-name=samtools      # Job submission name
#SBATCH --output=samtools%j.out   # Output file name with Job ID


# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity
export SINGULARITY_TMPDIR=/gpfs/summit/scratch/$USER
export SINGULARITY_CACHEDIR=/gpfs/summit/scratch/$USER
outdirectory=/gpfs/summit/scratch/tyak9569/dnFGFR/aligned/sorted
indirectory=/gpfs/summit/scratch/tyak9569/dnFGFR/aligned
mkdir -p $outdirectory

# Merge files
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools sort -m 25G -o ${outdirectory}/${filename}.sort.bam -T ${SLURM_JOBID} -@ 4 ${indirectory}/${filename}.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools index ${outdirectory}/${filename}.sort.bam