#!/bin/bash

IN_DIR="../1_3_PE_read_assembly"
OUT_DIR="../1_4_RemoveN"
SCRIPT="../../Tools/Fastq_Nread_trim.pl"

rm -rf $OUT_DIR
mkdir $OUT_DIR

for FILE in $IN_DIR/*extendedFrags.fastq
do
	FILENM=${FILE##*/}
	SAMPLE=${FILENM%.extendedFrags.fastq}
	echo -e "\n"
	date +"%Y/%m/%d %H:%M:%S"
	echo -e "Start removing N-containing reads from" $SAMPLE
	perl $SCRIPT $FILE >$OUT_DIR/$SAMPLE.Ntrimmed.fastq
	echo -e "N-containing read trimming finished"
done
