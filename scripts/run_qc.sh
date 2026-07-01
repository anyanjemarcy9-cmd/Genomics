#!/bin/bash

# FastQC on raw reads
fastqc ~/dc_workshop/data/untrimmed_fastq/*.fastq.gz

# Trimmomatic on paired-end reads
for infile in ~/dc_workshop/data/untrimmed_fastq/*_1.fastq.gz
do
    base=$(basename ${infile} _1.fastq.gz)
    trimmomatic PE \
        ${base}_1.fastq.gz ${base}_2.fastq.gz \
        ${base}_1.trim.fastq.gz ${base}_1un.trim.fastq.gz \
        ${base}_2.trim.fastq.gz ${base}_2un.trim.fastq.gz \
        SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15
done

# FastQC on trimmed reads
fastqc ~/dc_workshop/data/untrimmed_fastq/*.trim.fastq.gz
