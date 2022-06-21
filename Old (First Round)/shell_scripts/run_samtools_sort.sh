indirectory=/scratch/summit/tyak9569/dnFGFR/aligned/

for pathandfilename in `ls ${indirectory}*.bam`; do
name=`basename $pathandfilename .bam`
echo $pathandfilename
echo $name
sbatch --export=filename=$name samtools_sort.sh 
done