#!/bin/bash

# Written by: tyak9569
# Date: 20210316
# Purpose: Cutadapt script for tyak9569

#SBATCH --partition=shas    # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=001:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=6           # Number of tasks per job  
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=cutadapt      # Job submission name
#SBATCH --output=cutadapt%j.out   # Output file name with Job ID


# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity
export SINGULARITY_TMPDIR=/gpfs/summit/scratch/$USER
export SINGULARITY_CACHEDIR=/gpfs/summit/scratch/$USER
indirectory=/projects/tyak9569/dnFGFR/data
outdirectory=/gpfs/summit/scratch/tyak9569/dnFGFR/trimmedReads
mkdir -p $outdirectory

singularity run /projects/lowryc/software/containers/rnaseq.sif cutadapt -j 6 -u 15 -U 15 -q 20 -m 20	-a AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT -A GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG -o ${outdirectory}/${filename}_1_trimmed.fq.gz -p ${outdirectory}/${filename}_2_trimmed.fq.gz ${indirectory}/${filename}_1.fq.gz ${indirectory}/${filename}_2.fq.gz