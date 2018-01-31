#!/bin/bash

IN_DIR="../1_5_Length_check"
OUT_DIR="../1_6_Primer_removed"
OUT_DIR1="../1_6_Primer_removed/results"
OUT_DIR2="../1_6_Primer_removed/log"
SCRIPT="../../Tools/tagcleaner.pl"

rm -rf $OUT_DIR
rm -rf $OUT_DIR1
rm -rf $OUT_DIR2
mkdir $OUT_DIR
mkdir $OUT_DIR1
mkdir $OUT_DIR2

for FNAME in $IN_DIR/*.MiFish.fastq
do
	FILE=${FNAME##*/} 
	SAMPLE=${FILE%.MiFish.fastq}
	COMMAND1="perl $SCRIPT -verbose -fastq $IN_DIR/$FILE -out_format 1 -out $OUT_DIR1/$SAMPLE.MiFish_processed -nomatch 3 -mm3 4 -mm5 4 -tag3 CAAACTGGGATTAGATACCCCACTATGNNNNN -tag5 NNNNNGTCGGTAAAACTCGTGCCAGC"
	echo $COMMAND1 >> $OUT_DIR/1_6_command_MiFish.sh

	COMMAND2="perl $SCRIPT -verbose -fastq $IN_DIR/$FILE -out_format 1 -stats $OUT_DIR2 -out $OUT_DIR1/$SAMPLE.MiFish_processed -nomatch 3 -mm3 4 -mm5 4 -tag3 CAAACTGGGATTAGATACCCCACTATGNNNNN -tag5 NNNNNGTCGGTAAAACTCGTGCCAGC"
	echo "$COMMAND2 > $OUT_DIR2/"$SAMPLE".log" >> $OUT_DIR/1_6_command_MiFish.sh
done

chmod 774 ../1_6_Primer_removed/1_6_command_MiFish.sh
../1_6_Primer_removed/1_6_command_MiFish.sh

# MiFish-F
# NNNNNNGTCGGTAAAACTCGTGCCAGC
# MiFish-R
# NNNNNNCATAGTGGGGTATCTAATCCCAGTTTG
