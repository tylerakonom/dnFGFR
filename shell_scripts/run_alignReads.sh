indirectory=/scratch/summit/tyak9569/dnFGFR/trimmedReads/

for pathandfilename in `ls ${indirectory}*_trimmed.fq.gz`; do
name=`basename $pathandfilename _trimmed.fq.gz`
echo $pathandfilename
echo $name
sbatch --export=filename=$name alignReads.sh 
done