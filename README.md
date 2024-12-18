# Opposite-Sex Housing and dnFGFR Animals
*How housing conditions effect dnFGFR animals, an exploratory RNA-Seq study.*


## Background

We set out to understand the gene expression changes preceding a rescue effect in dnFGFR animals housed with same-sex partners during an experiment conducted by [Rocherster et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3532464/). We performed an RNA-Seq experiment and deferentially expressed genes were documented for further study.


## Data Processing
*Getting raw reads ready for analysis.*

All files were uploaded to the Alpine module as part of the research computing program at CU Boulder. Basic tutorials on how to work with the RC computing environment and FAQs are located [here](https://curc.readthedocs.io/en/latest/). All files were uploaded to the users scratch folder, then processed. Software was called from the container located in the Alpine module at:

	/projects/lowryc/software/containers/


#### Pre-processing from Novogene

Results were received in the form of ".bam" files from [Novogene](https://www.novogene.com/us-en/), representing trimmed and aligned reads. 

#### Generating Raw Read Counts

Raw read counts were generated using the [Rsubread (v2.0.1)](https://bioconductor.org/packages/release/bioc/html/Rsubread.html) for [R (v3.6.1)](https://www.r-project.org/) package installed on Alpine. Reads were annotated with the [NCBI refSeq genome](https://www.ncbi.nlm.nih.gov/refseq/). Processing was performed by switching to a compile node with this command:

	$ ssh scompile

R was run by calling and running R in the anaconda environment on Alpine:

	$ source /curc/sw/anaconda/default
	$ conda activate r361
	$ R

The script [Rsubread.Rmd](https://github.com/tylerakonom/dnFGFR/blob/master/RScripts/Rsubread.Rmd) was entered into the R terminal, and the output was stored as a text file for processing and analysis.

From this point on, the processing was performed on a local machine.


## Analyzing Counts
*Turning counts into results.*

Raw read counts were normalized and analyzed for differential expression using [DESeq2(v1.36.0)](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) for R, and [coverageless.rmd](https://github.com/tylerakonom/dnFGFR/blob/master/RScripts/coverageless.Rmd). All outputs were stored under [deseq_outputs](https://github.com/tylerakonom/dnFGFR/tree/master/deseq_outputs) as .csv files, and "working" excel spreadsheets were created to assist in analysis. Sample outlier detection was performed using robust PCA and outlying samples were removed. The time variable (PN140 vs PN320) was identified as a confounder by PCA in the differential expression analysis of the effect of housing. As a result, PN140 animals were removed from further analysis. Genes were considered significant with adjusted p < 0.1.
