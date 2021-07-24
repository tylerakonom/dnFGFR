#!/bin/bash
FILES1=/projects/ehringer/Tsai/rawReads/*.gz

rm /projects/ehringer/Tsai/data/rawReadCounts.txt
for f in $FILES1
do
	gunzip -c $f | awk '/@HISEQ/ {get line; print length($0)}' | awk -v sample="$f" '{sum+=$1} END {print sample, sum/NR, NR}' >> /projects/ehringer/Tsai/data/rawReadCounts.txt
done
