##Running Rsubread for counts:

# $ source /curc/sw/anaconda/default
# $ conda activate r361
# $ R

library(Rsubread)
TMP = "/scratch/summit/tyak9569/dnFGFR/rsub/"

files=c(
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1006.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1007.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1008.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1009.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1010.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1016.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1017.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1018.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1019.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A1020.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1106.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1107.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1108.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1109.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1110.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1116.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1117.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1118.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1119.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B1120.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2001.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2002.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2003.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2004.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2005.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2011.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2012.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2013.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2014.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/A2015.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2101.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2102.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2103.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2104.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2105.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2111.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2112.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2113.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2114.sort.bam',
'/scratch/summit/tyak9569/dnFGFR/aligned/sorted/B2115.sort.bam')

## Point to GTF file:

gtf=("/projects/tyak9569/dnFGFR/genome/fixedgenes.gtf")

## Output the file:

OUT="/scratch/summit/tyak9569/dnFGFR/rsub/"

# Unstranded

senseunique=featureCounts(files,
isGTFAnnotationFile = TRUE,
annot.ext = gtf,
GTF.attrType = "gene_id",
allowMultiOverlap = FALSE,
nthreads = 36,
isPairedEnd=TRUE,
strandSpecific = 0)

write.table(x=data.frame(
senseunique$annotation[,c("GeneID","Length")],
senseunique$counts,stringsAsFactors=FALSE),
file=paste(OUT,"rsubread_senseunique_0.txt"),
quote=FALSE,sep="\t",row.names=FALSE) 

# Forward Stranded

senseunique=featureCounts(files,
isGTFAnnotationFile = TRUE,
annot.ext = gtf,
GTF.attrType = "gene_id",
allowMultiOverlap = FALSE,
nthreads = 18,
isPairedEnd=TRUE,
strandSpecific = 1)

write.table(x=data.frame(
senseunique$annotation[,c("GeneID","Length")],
senseunique$counts,stringsAsFactors=FALSE),
file=paste(OUT,"rsubread_senseunique_1.txt"),
quote=FALSE,sep="\t",row.names=FALSE) 

# Reverse Stranded

senseunique=featureCounts(files,
isGTFAnnotationFile = TRUE,
annot.ext = gtf,
GTF.attrType = "gene_id",
allowMultiOverlap = FALSE,
nthreads = 18,
isPairedEnd=TRUE,
strandSpecific = 2)

write.table(x=data.frame(
senseunique$annotation[,c("GeneID","Length")],
senseunique$counts,stringsAsFactors=FALSE),
file=paste(OUT,"rsubread_senseunique_2.txt"),
quote=FALSE,sep="\t",row.names=FALSE) 

# Antisense

antisenseunique=featureCounts(files,
isGTFAnnotationFile = TRUE,
annot.ext = gtf,
GTF.attrType = "gene_id",
allowMultiOverlap = TRUE,
isPairedEnd=FALSE,
nthreads = 18,
strandSpecific = 2)
 
write.table(x=data.frame(
antisenseunique$annotation[,c("GeneID","Length")],
antisenseunique$counts,stringsAsFactors=FALSE),
file=paste(OUT,"Rsubread_antisenseunique.txt"),
quote=FALSE,sep="\t",row.names=FALSE)
