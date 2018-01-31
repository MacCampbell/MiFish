#!/bin/bash
#$ -S /bin/sh

IN_DIR01="../4_1_Allsamples_specieslist"
IN_DIR02="../3_2_BlastnRes_counts/parsedfiles"
OUT_DIR="../5_2_Fasta_from_Each_samples"
SCRIPT="../../Parsers"

rm -rf $OUT_DIR
mkdir $OUT_DIR

for FNAME in $IN_DIR02/*blastn.deprep.list.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.deprep.list.txt}
	mkdir $OUT_DIR/$SAMPLE
	perl $SCRIPT/mfasta_maker.pl $IN_DIR01/allsamples_specieslist.txt $IN_DIR02/$FILE $OUT_DIR/$SAMPLE
done
