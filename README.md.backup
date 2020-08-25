# dnFGFR
How housing conditions effect dnFGFR animals, an exploratory RNA-Seq study.

To begin understanding the gene expression changes preceeding a rescue effect in dnFGFR animals housed with same-sex partners during an experiment conducted by [Rocherster et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3532464/), an RNA-Seq experiment was performed, and deferentially expressed genes were documented for further study. The pipeline is as follows:

![dnFGFR Pipeline](https://github.com/tylerakonom/dnFGFR/blob/master/Graphics/Pipeline.png)

## Data Pre-processing

All files were uploaded to the Summit module, as part of the research computing program at CU Boulder. Basic tutorials on how to work with the RC computing environment and FAQs are located [here](https://curc.readthedocs.io/en/latest/faq.html). All files were uploaded to the users project folder, then processed in the scratch directory. Software was called from the software container located in the summit module at:

	/projects/ehringer/software/scripts

RC requires the use of a header for jobs to queue. An example header is as follows:

	#!/bin/bash #The type of script being run
	#SBATCH -J trimReads #Name of the script being run
	#SBATCH -n 6 # Number of processing cores requested to complete the job
	#SBATCH -N 1 # Number of nodes requested
	#SBATCH -t 10:00:00 # Run time in HH:MM:SS 
	#SBATCH --partition=shas


### Adapter Trimming

[Cutadapt(v2.1)](https://cutadapt.readthedocs.io/en/stable/) was used to remove the adapter sequences from the 3' and  5' ends of each read, low quality ends were removed (20 base pairs from the 3' end), and reads smaller than 20 base pairs in length were filtered out with the shell script [trimReads](https://github.com/tylerakonom/dnFGFR/blob/master/Shell Scripts/trimReads.sh). 

### Post Trim Quality Control

[FastQC (v0.11.8)](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) was used to visualize the 
