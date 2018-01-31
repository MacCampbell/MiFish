#!/bin/bash

IN_DIR="../1_2_TailTrimming"
OUT_DIR="../1_3_PE_read_assembly"

rm -rf $OUT_DIR
mkdir $OUT_DIR

for FNAME in $IN_DIR/*R1_001.fastq.trimmed

do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%_L001*}
	
	echo -e "\n"
	date +"%Y/%m/%d %H:%M:%S"
	echo -e "Starting PE read assembly of the sample: "$SAMPLE

	../../Tools/FLASH-1.2.11/flash $IN_DIR/$SAMPLE*R1*.fastq.trimmed $IN_DIR/$SAMPLE*R2*.fastq.trimmed -o $SAMPLE -d $OUT_DIR/
	echo -e "Assembly finished\n"
done
