#!/bin/bash
#$ -S /bin/sh

IN_DIR="../5_1_Fasta_from_All_samples"
IN_DIR2="../5_1_Fasta_from_All_samples/for_morphy"
OUT_DIR="../5_3_Alignment_from_All_samples"
OUT_DIR2="../5_3_Alignment_from_All_samples/for_morphy"
MAFFT="/usr/local/bin/mafft"

rm -rf $OUT_DIR
mkdir $OUT_DIR
rm -rf $OUT_DIR2
mkdir $OUT_DIR2

for FNAME in $IN_DIR/*.fa
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.fa}
	$MAFFT $IN_DIR/$FILE > $OUT_DIR/$SAMPLE.aln.fa
done

for FNAME in $IN_DIR2/*fa.clu.fa
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.fa.clu.fa}
	$MAFFT --clustalout $IN_DIR2/$FILE > $OUT_DIR2/$SAMPLE.aln.clu.fa
done
