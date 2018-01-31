#!/bin/bash
#$ -S /bin/sh

IN_DIR1="../1_3_TailTrimming"
IN_DIR2="../1_4_PE_assembly"
IN_DIR3="../1_5_RemoveN"
IN_DIR4="../1_6_Length_check"
IN_DIR5="../data"

rm -f $IN_DIR1/*.fastq.trimmed
rm -f $IN_DIR2/*.extendedFrags.fastq $IN_DIR2/*.notCombined_1.fastq $IN_DIR2/*.notCombined_2.fastq
rm -f $IN_DIR3/*.Ntrimmed.fastq
rm -f $IN_DIR4/*.fastq
gzip $IN_DIR5/*.fastq
