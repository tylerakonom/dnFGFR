# Opposite-Sex Housing and dnFGFR Animals
*How housing conditions effect dnFGFR animals, an exploratory RNA-Seq study.*


## Background

We set out to understand the gene expression changes preceding a rescue effect in dnFGFR animals housed with same-sex partners during an experiment conducted by [Rocherster et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3532464/). We performed an RNA-Seq experiment and deferentially expressed genes were documented for further study.


## Data Pre-processing
*Getting raw reads ready for analysis.*

All files were uploaded to the summit module as part of the research computing program at CU Boulder. Basic tutorials on how to work with the RC computing environment and FAQs are located [here](https://curc.readthedocs.io/en/latest/faq.html). All files were uploaded to the users project folder, then processed in the scratch directory. Software was called from the container located in the summit module at:

	/projects/lowryc/software/containers/

RC requires the use of a header for jobs to queue. An example header is as follows:

	#!/bin/bash #The type of script being run
	#SBATCH -J trimReads #Name of the script being run
	#SBATCH -n 6 # Number of processing cores requested to complete the job
	#SBATCH -N 1 # Number of nodes requested
	#SBATCH -t 10:00:00 # Run time in HH:MM:SS 
	#SBATCH --partition=shas

The job was then run using the following command:

	$ sbatch <name of script to run>


#### Aligning to the Genome

Trimmed samples were aligned to the NCBI ([GRCm38 mm10](https://www.ncbi.nlm.nih.gov/assembly/GCF_000001635.20/)) mouse genome using [HISAT2](https://ccb.jhu.edu/software/hisat2/manual.shtml) by [Novogene](https://www.novogene.com/us-en/). Results were received in the form of ".bam" files.

#### Generating Raw Read Counts

Raw read counts were generated using the [Rsubread (v2.0.1)](https://bioconductor.org/packages/release/bioc/html/Rsubread.html) for [R (v3.6.1)](https://www.r-project.org/) package installed on summit. Reads were annotated with the [NCBI refSeq genome](https://www.ncbi.nlm.nih.gov/refseq/). Processing was performed by switching to a compile node with this command:

	$ ssh scompile

R was run by calling and running R in the anaconda environment on summit:

	$ source /curc/sw/anaconda/default
	$ conda activate r361
	$ R

The script [Rsubread.R](https://github.com/tylerakonom/dnFGFR/blob/master/RScripts/Rsubread.R) was entered into the R terminal, and the output was stored as a text file for processing and analysis.

From this point on, the processing was performed on a local machine. The command to copy a file from the summit cluster looks like this:

	$ scp <username>@login.rc.colorado.edu:<path to file you want to transfer> ~<path to folder on the local machine you want to copy to>


## Analyzing Counts
*Turning counts into results.*

Raw read counts were normalized and analyzed for differential expression using [DESeq2(v1.36.0)](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) for R, and [coverageless.rmd](https://github.com/tylerakonom/dnFGFR/blob/master/R_scripts/coverageless.Rmd). All outputs were stored under [deseq_outputs](https://github.com/tylerakonom/dnFGFR/tree/master/deseq_outputs) as .csv files, and "working" excel spreadsheets were created to assist in analysis. Sample outlier detection was performed using robust PCA and outlying samples were removed. The time variable (PN140 vs PN320) was identified as a confounder by PCA in the differential expression analysis of the effect of housing. As a result, PN140 animals were removed from further analysis. Genes were considered significant with adjusted p < 0.1.
