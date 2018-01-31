#!/bin/bash
#$ -S /bin/sh

IN_DIR="../2_1_Uclust"
OUT_DIR="../3_1_BlastnRes"

rm -rf $OUT_DIR
mkdir $OUT_DIR

# Specify Blastn database name
DBname="MiFish_DB_v23"

DB="../../BlastDB/$DBname"

for FNAME in $IN_DIR/*.sizetrim.sum.fasta
do
	FILE=${FNAME##*/} 
	SAMPLE=${FILE%.sizetrim.sum.fasta}
	echo -e "\nStart Blastn search analysis for :"$SAMPLE
	../../Tools/ncbi-blast-2.2.31+/bin/blastn -query $FNAME -db $DB -max_target_seqs 5 -perc_identity 97 -evalue 0.00001 -outfmt "7 sseqid pident length mismatch gapopen evalue bitscore qseq" -out $OUT_DIR/$SAMPLE.blastn_res.txt -html
done

echo -e "\nBlastn search analysis finished"
