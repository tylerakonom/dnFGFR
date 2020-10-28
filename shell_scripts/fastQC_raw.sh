#!/bin/bash
#SBATCH -J FastQC
#SBATCH -n 4 #number of cores being used
#SBATCH -N 1 #ensure that all cores are on the same node
#SBATCH -t 4-00:00 #how long we think it will take
#SBATCH --partition=shas

export PATH=$PATH:/projects/ehringer/software/scripts
module load singularity

FILES1=/projects/tyak9569/dnFGFR/data/*.fq.gz
for f in $FILES1
do
  	rnaseq fastqc $f
done


