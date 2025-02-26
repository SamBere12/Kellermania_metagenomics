#!/bin/bash
#this is my first script, to analyze the alignments files
ls SRR*.bam | while read line 
do 
	name=$(echo $line | cut -f1 -d'.')
	echo $name 
	echo "sort"
	samtools sort -o samplesedit/${name}_sorted.bam ${name}.bam
	echo "index"
	samtools index samplesedit/${name}_sorted.bam 
	echo depth 
	samtools depth -aa samplesedit/${name}_sorted.bam > samplesedit/${name}_sorted.tsv
#	awk -v defline="$name" 'BEGIN {FS=OFS="\t"} NR==1 {print $0, "sample"} NR>1 {print $0, defline}' samplesedit/${name}_sorted.tsv > samplesedit/${name}_mod.tsv
	awk -v defline="$name" 'BEGIN {FS=OFS="\t"} {print $0, defline}' samplesedit/${name}_sorted.tsv > samplesedit/${name}_mod.tsv
done
