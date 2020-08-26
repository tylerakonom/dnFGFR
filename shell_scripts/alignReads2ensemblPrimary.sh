#!/bin/bash
#SBATCH -J alignReads
#SBATCH -n 12 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one node
#SBATCH -t 20:00:00 # Runtime
#SBATCH --partition=shas

export PATH=$PATH:/projects/ehringer/software/scripts
ml singularity

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1106.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1106_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1106_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1106.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1107.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1107_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1107_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1107.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1108.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1108_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1108_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1108.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1109.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1109_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1109_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1109.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1110.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1110_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1110_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1110.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1116.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1116_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1116_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1116.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1117.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1117_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1117_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1117.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1118.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1118_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1118_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1118.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1119.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1119_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1119_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1119.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1120.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1120_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B1120_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1120.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2101.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2101_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2101_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2101.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2102.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2102_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2102_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2102.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2103.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2103_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2103_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2103.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2104.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2104_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2104_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2104.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2105.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2105_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2105_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2105.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2111.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2111_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2111_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2111.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2112.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2112_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2112_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2112.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2113.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2113_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2113_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2113.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2114.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2114_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2114_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2114.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2115.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2115_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/B2115_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2115.bam