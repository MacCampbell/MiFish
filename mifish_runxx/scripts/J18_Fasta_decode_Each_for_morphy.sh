#!/bin/bash
#$ -S /bin/sh

IN_DIR1="../3_2_BlastnRes_counts/parsedfiles"
IN_DIR2="../5_2_Fasta_from_Each_samples"

OUT_DIR="../5_2_Fasta_from_Each_samples"
SCRIPT="../../Parsers"

rm -rf $OUT_DIR/for_morphy
mkdir $OUT_DIR/for_morphy

for FNAME in $IN_DIR1/*.blastn.deprep.list.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.deprep.list.txt}
	mkdir $OUT_DIR/for_morphy/$SAMPLE
	
	for FASTAS in $IN_DIR2/$SAMPLE/*.fa
	do
		FASTA=${FASTAS##*/}
		echo -e "\nDecoding fasta files for morphy: "$SAMPLE
		perl $SCRIPT/mfasta_name_encoder.pl $IN_DIR2/$SAMPLE/$FASTA $OUT_DIR/for_morphy/$SAMPLE
	done
done
