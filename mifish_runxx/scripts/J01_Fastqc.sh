#!/bin/bash

IN_DIR="../data"
OUT_DIR="../1_1_FastQC"
FastQC="../../Tools/FastQC/fastqc"

rm -rf $OUT_DIR
mkdir $OUT_DIR

echo -e "Decompressing files\n"
gzip -d $IN_DIR/*.gz

echo -e "Merging read 1 files\n"
cat $IN_DIR/*R1* > $OUT_DIR/R1_merged.fastq

echo -e "Merging read 2 files\n"
cat $IN_DIR/*R2* > $OUT_DIR/R2_merged.fastq

date +"%Y/%m/%d %H:%M:%S"

echo -e "Starting FastQC\n"
$FastQC $OUT_DIR/*fastq
rm $OUT_DIR/R1_merged.fastq $OUT_DIR/R2_merged.fastq
echo -e "FastQC finished\n"
