#!/bin/bash
#$ -S /bin/sh

IN_DIR="../5_1_Fasta_from_All_samples"
OUT_DIR="../5_1_Fasta_from_All_samples/for_morphy"
SCRIPT="../../Parsers"

rm -rf $OUT_DIR
mkdir $OUT_DIR

# $FNAME はフルパス
# $FILE はファイル名
# $SAMPLE はサンプル名

for FNAME in $IN_DIR/*.fa
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.fa}
	echo -e "\nDecoding fasta files for morphy: "$SAMPLE
	perl $SCRIPT/mfasta_name_encoder.pl $IN_DIR/$FILE $OUT_DIR
done
