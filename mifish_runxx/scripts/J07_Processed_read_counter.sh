#!/bin/bash

IN_DIR0="../data"
IN_DIR1="../1_2_TailTrimming"
IN_DIR2="../1_3_PE_read_assembly"
IN_DIR3="../1_4_RemoveN"
IN_DIR4="../1_5_Length_check"
IN_DIR5="../1_6_Primer_removed/results"

OUT_DIR="../1_7_processed_read_counts"

rm -rf $OUT_DIR
mkdir -p $OUT_DIR

date +"%Y/%m/%d %H:%M:%S"
echo "Processed-read counting started"


echo "Counting raw read numbers"

ls $IN_DIR0/*_L001_R1_001.fastq | sort -d | sed s/'.*\/'//g | sed s/'_L001_R1_001.fastq'//g >> $OUT_DIR/1_0_Raw_NAMES.txt

grep -c '^@M' $IN_DIR0/*_L001_R1_001.fastq  | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_0_Raw_READ_counts_R1.txt

grep -c '^@M' $IN_DIR0/*_L001_R2_001.fastq  | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_0_Raw_READ_counts_R2.txt


echo "Counting tail-trimmed reads"

ls $IN_DIR1/*_L001_R1_001.fastq.trimmed | sort -d | sed s/'.*\/'//g | sed s/'_L001_R1_001.fastq.trimmed'//g >> $OUT_DIR/1_2_Tail-trimmed_NAMES_R1.txt

ls $IN_DIR1/*_L001_R2_001.fastq.trimmed | sort -d | sed s/'.*\/'//g | sed s/'_L001_R2_001.fastq.trimmed'//g >> $OUT_DIR/1_2_Tail-trimmed_NAMES_R2.txt

grep -c '^@M' $IN_DIR1/*_L001_R1_001.fastq.trimmed | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_2_trimmed_READ_counts_R1.txt

grep -c '^@M' $IN_DIR1/*_L001_R2_001.fastq.trimmed | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_2_trimmed_READ_counts_R2.txt


echo "Counting paired-end assembled reads"

ls $IN_DIR2/*extendedFrags.fastq | sort -d | sed s/'.*\/'//g | sed s/'.extendedFrags.fastq'//g >> $OUT_DIR/1_3_Assembled_NAMES.txt

grep -c '^@M' $IN_DIR2/*extendedFrags.fastq | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_3_Assembled_READ_counts.txt

grep -c '^@M' $IN_DIR2/*notCombined_1.fastq | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_3_NotCombined_R1_READ_counts.txt
grep -c '^@M' $IN_DIR2/*notCombined_2.fastq | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_3_NotCombined_R2_READ_counts.txt

echo "Counting N-trimmed reads"

ls $IN_DIR3/*Ntrimmed.fastq | sort -d | sed s/'.*\/'//g | sed s/'.Ntrimmed.fastq'//g >> $OUT_DIR/1_4_Nread-removed_NAMES.txt

grep -c '^@M' $IN_DIR3/*Ntrimmed.fastq | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_4_Nread-removed_READ_counts.txt


echo "Counting length-checked reads"

ls $IN_DIR4/*MiFish.fastq | sort -d | sed s/'.*\/'//g | sed s/'.MiFish.fastq'//g >> $OUT_DIR/1_5_Length_filtering_NAMES.txt

grep -c '^@M' $IN_DIR4/*MiFish.fastq | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_5_Length_passed_READ_counts.txt


echo "Counting primer-removed reads"

ls $IN_DIR5/*MiFish_processed.fasta | sort -d | sed s/'.*\/'//g | sed s/'.MiFish_processed.fasta'//g >> $OUT_DIR/1_6_Primer_removed_NAMES.txt

grep -c '^>' $IN_DIR5/*MiFish_processed.fasta | sort -d | sed s/'.*:'//g >> $OUT_DIR/1_6_Primer_removed_READ_counts.txt
