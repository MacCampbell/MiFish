#!/bin/bash

IN_DIR="../1_4_RemoveN"
OUT_DIR="../1_5_Length_check"
SCRIPT="../../Tools/check_seq_length_MiFish.pl"

rm -rf $OUT_DIR
mkdir $OUT_DIR

for FILE in $IN_DIR/*.fastq
do
	FILENM=${FILE##*/}
	SAMPLE=${FILENM%.Ntrimmed.fastq}
	echo -e "\n"
	date +"%Y/%m/%d %H:%M:%S"
	echo -e "Starting length filtering (229 +- 25 bp) of" $SAMPLE
	perl $SCRIPT $FILE >$OUT_DIR/$SAMPLE.MiFish.fastq
	echo -e "Length filtering finished at "
done

