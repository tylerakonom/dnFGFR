#!/bin/bash
#SBATCH -J trimReads
#SBATCH -n 6 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one node
#SBATCH -t 10:00:00 # Runtime 
#SBATCH --partition=shas

export PATH=$PATH:/projects/ehringer/software/scripts 
ml singularity

mkdir /scratch/summit/tyak9569/dnFGFR
mkdir /scratch/summit/tyak9569/dnFGFR/trimmedReads

FILES1=/projects/tyak9569/dnFGFR/data/*_1*.fq.gz
for f in $FILES1
do
	f2=${f//_1/_2}
	f_trimmed=${f//.fq.gz/_trimmed.fq.gz}
	f_trimmed=${f_trimmed//\/projects\/tyak9569\/dnFGFR\/data/\/scratch\/summit\/tyak9569\/dnFGFR\/trimmedReads}
	f2_trimmed=${f2//.fq.gz/_trimmed.fq.gz}
	f2_trimmed=${f2_trimmed//\/projects\/tyak9569\/dnFGFR\/data/\/scratch\/summit\/tyak9569\/dnFGFR\/trimmedReads}
	rnaseq cutadapt -j 6 -u 15 -U 15 -q 20 -m 20	-a AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT -A GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG -o $f_trimmed -p $f2_trimmed $f $f2
done

