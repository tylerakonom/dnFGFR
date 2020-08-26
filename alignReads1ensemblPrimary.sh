#!/bin/bash
#SBATCH -J alignReads
#SBATCH -n 12 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one node
#SBATCH -t 20:00:00 # Runtime
#SBATCH --partition=shas

export PATH=$PATH:/projects/ehringer/software/scripts
ml singularity

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1006.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1006_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1006_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1006.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1007.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1007_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1007_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1007.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1008.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1008_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1008_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1008.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1009.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1009_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1009_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1009.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1010.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1010_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1010_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1010.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1016.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1016_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1016_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1016.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1017.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1017_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1017_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1017.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1018.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1018_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1018_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1018.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1019.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1019_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1019_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1019.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned1020.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1020_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A1020_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1020.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2001.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2001_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2001_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2001.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2002.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2002_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2002_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2002.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2003.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2003_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2003_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2003.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2004.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2004_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2004_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2004.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2005.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2005_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2005_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2005.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2011.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2011_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2011_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2011.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2012.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2012_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2012_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2012.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2013.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2013_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2013_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2013.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2014.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2014_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2014_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2014.bam

rnaseq hisat2 -p 4 --summary-file /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/out/aligned2015.txt -x /scratch/summit/tyak9569/dnFGFR/ensembl/primary/GRCm38 -1 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2015_1_trimmed.fq.gz -2 /scratch/summit/tyak9569/dnFGFR/trimmedReads/A2015_2_trimmed.fq.gz -S /scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2015.bam

