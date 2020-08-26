# Opposite-Sex Housing and dnFGFR Animals
*How housing conditions effect dnFGFR animals, an exploratory RNA-Seq study.*


## Background

We set out to understand the gene expression changes preceding a rescue effect in dnFGFR animals housed with same-sex partners during an experiment conducted by [Rocherster et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3532464/). We performed an RNA-Seq experiment and deferentially expressed genes were documented for further study. The pipeline used is as follows:

![dnFGFR Pipeline](https://github.com/tylerakonom/dnFGFR/blob/master/graphics/pipeline_8.25.20.png)

## Data Pre-processing

All files were uploaded to the summit module as part of the research computing program at CU Boulder. Basic tutorials on how to work with the RC computing environment and FAQs are located [here](https://curc.readthedocs.io/en/latest/faq.html). All files were uploaded to the users project folder, then processed in the scratch directory. Software was called from the container located in the summit module at:

	/projects/ehringer/software/scripts

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

Trimmed samples were aligned to the Ensembl ([GRCm38](ftp://ftp.ensembl.org/pub/release-101/gtf/mus_musculus/)) primary mouse genome using [HISAT2 (v2.1.0)](https://ccb.jhu.edu/software/hisat2/manual.shtml) and two scripts due to a cap in run time ([align_1](https://github.com/tylerakonom/dnFGFR/blob/master/shell_scripts/alignReads1ensemblPrimary.sh) and [align_2](https://github.com/tylerakonom/dnFGFR/blob/master/shell_scripts/alignReads2ensemblPrimary.sh)). This accomplished two primary objectives, assigning a gene to each read and combining the two paired-end reads into one ".bam" file. [Here](https://github.com/tylerakonom/dnFGFR/blob/master/aligned1006.txt) is an example of the HISAT2 output, giving the results of the alignment for a sample (A1006).

#### Generating Raw Read Counts

Raw read counts were generated using the [Rsubread (v2.0.1)](https://bioconductor.org/packages/release/bioc/html/Rsubread.html) for [R (v3.6.1)](https://www.r-project.org/) package installed on summit. Processing was performed by switching to a compile node with this command:

	$ ssh scompile

R was run by calling and running R in the anaconda environment on summit:

	$ source /curc/sw/anaconda/default
	$ conda activate r361
	$ R




