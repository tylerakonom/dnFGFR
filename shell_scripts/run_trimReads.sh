indirectory=/projects/tyak9569/dnFGFR/data/

for pathandfilename in `ls ${indirectory}*_1.fq.gz`; do
name=`basename $pathandfilename _1.fq.gz`
echo $pathandfilename
echo $name
sbatch --export=filename=$name trimReads.sh 
done