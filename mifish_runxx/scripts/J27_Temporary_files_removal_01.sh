#!/bin/bash
#$ -S /bin/sh

IN_DIR1="../1_3_TailTrimming"
IN_DIR2="../1_4_PE_assembly"
IN_DIR3="../1_5_N_removal"
IN_DIR4="../1_6_Length_filtering_SALMO"
IN_DIR5="../1_6_Length_filtering_THUNN"
IN_DIR6="../1_6_Length_filtering_UNIV"

rm -f $IN_DIR1/*.fastq.trimmed
rm -f $IN_DIR2/*.extendedFrags.fastq $IN_DIR2/*.notCombined_1.fastq $IN_DIR2/*.notCombined_2.fastq
rm -f $IN_DIR3/*.Ntrimmed.fastq
rm -f $IN_DIR4/*.lengthchecked.fastq
rm -f $IN_DIR5/*.lengthchecked.fastq
rm -f $IN_DIR6/*.lengthchecked.fastq
