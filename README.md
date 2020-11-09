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


#### Adapter Trimming

[Cutadapt(v2.1)](https://cutadapt.readthedocs.io/en/stable/) was used to remove the adapter sequences from the 3' and  5' ends of each read, low quality ends were removed (20 base pairs from the 3' end), and reads smaller than 20 base pairs in length were filtered out with the shell script [trimReads](https://github.com/tylerakonom/dnFGFR/blob/master/shell_scripts/trimReads.sh). 


#### Post Trim Quality Control

[FastQC (v0.11.8)](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) was used to visualize the data to check for quality before continued processing using [this](https://github.com/tylerakonom/dnFGFR/blob/master/shell_scripts/fastQC.sh) script. An example of good Illumina data can be found [here](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/good_sequence_short_fastqc.html#M2) and an example of our trimmed data (sample A1006-1) can be found [here](https://htmlpreview.github.io/?https://github.com/tylerakonom/dnFGFR/blob/master/Example_FastQC_Output_A1006-1.html).

A few discrepancies between the two examples given can be explained by the fact that we are working with already trimmed RNA-Seq data, and not genomic DNA like the "perfect" example. "Sequence Length Distribution" curves upward, indicating that we have successfully removed small irrelevant reads during trimming. Our "Sequence Duplication Levels" graph shows that a good chunk of our sequences were duplicated 10-50  times, and further analysis will allow us to filter some of the lower expressed genes out of our data set. Our "Per Sequence GC Content" and "Per Tile Sequence Quality" being flagged isn't irregular, and both are within acceptable limits.


#### Align to the Genome

Trimmed samples were aligned to the NCBI ([GRCm38, mm10](https://www.ncbi.nlm.nih.gov/assembly/GCF_000001635.20/)) mouse genome using [HISAT2 (v2.1.0)](https://ccb.jhu.edu/software/hisat2/manual.shtml) and [**alignReads.sh**](https://github.com/tylerakonom/dnFGFR/blob/master/shell_scripts/alignReads.sh). This script was queued in Summit by calling the script and inputting filenames with [**run_alignReads.sh**](https://github.com/tylerakonom/dnFGFR/blob/master/shell_scripts/run_alignReads.sh). This was done in the bash terminal in a "compile" node. To ssh into a compile node, this command was used:

	$ ssh scompile

By running the following command, the script "run_alignReads.sh" was run, file names were generated automatically, and input into the "alignReads.sh" script:

	$ bash run_alignReads.sh

This accomplished two primary objectives, assigning a gene to each read and combining the two paired-end reads into one ".bam" file. [Here](https://github.com/tylerakonom/dnFGFR/blob/master/aligned1006.txt) is an example of the HISAT2 output, giving the results of the alignment for a sample (A1006). Unsorted outputs from Hisat2 were then sorted using [Samtools v1.9](https://www.htslib.org/doc/1.9/samtools.html), [run_samtools_sort.sh](https://github.com/tylerakonom/dnFGFR/blob/master/shell_scripts/run_samtools_sort.sh), and [samtools_sort.sh](https://github.com/tylerakonom/dnFGFR/blob/master/shell_scripts/samtools_sort.sh).

#### Generating Raw Read Counts

Raw read counts were generated using the [Rsubread (v2.0.1)](https://bioconductor.org/packages/release/bioc/html/Rsubread.html) for [R (v3.6.1)](https://www.r-project.org/) package installed on summit. Reads were annotated with the [NCBI refSeq genome](https://www.ncbi.nlm.nih.gov/refseq/) downloaded from [**here**](https://support.illumina.com/sequencing/sequencing_software/igenome.html). Processing was performed by switching to a compile node with this command:

	$ ssh scompile

R was run by calling and running R in the anaconda environment on summit:

	$ source /curc/sw/anaconda/default
	$ conda activate r361
	$ R

The script [Rsubread.R](https://github.com/tylerakonom/dnFGFR/blob/master/Rsubread.R) was entered into the R terminal, and the output was stored as a text file for processing and analysis.

From this point on, the processing was performed on a local machine. The command to copy a file from the summit cluster looks like this:

	$ scp <username>@login.rc.colorado.edu:<path to file you want to transfer> ~<path to folder on the local machine you want to copy to>


## Analyzing Counts
*Turning counts into results.*

Raw read counts were normalized and analyzed for differential expression using [DESeq2(v1.26.0)](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) for R, and [DESEQ2.rmd](https://github.com/tylerakonom/dnFGFR/blob/master/R_scripts/DESEQ2.Rmd). All outputs were stored under [deseq_outputs](https://github.com/tylerakonom/dnFGFR/tree/master/deseq_outputs) as .csv files, and "working" excel spreadsheets were created to assist in analysis. Since our primary question related to the effect of opposite-sex housing on dnFGFR animals, PN140 dnFGFR animals were compared for differentially expressed genes (DEGs). DEGs were grouped based on physiological relevance using GO enrichment provided by [ShinyGO v0.61](http://bioinformatics.sdstate.edu/go/).

