#!/bin/bash
#$ -S /bin/sh

IN_DIR="../8_1_97nohits_fas"
OUT_DIR="../8_2_97nohits_BlastnRes"

rm -rf $OUT_DIR
mkdir $OUT_DIR

##################################
## Specify Blastn database name ##
##################################
DBname="MiFish_DB_v23"

DB="../../BlastDB/$DBname"

for FNAME in $IN_DIR/*.97nohits.fasta
do
	FILE=${FNAME##*/} 
	SAMPLE=${FILE%.97nohits.fasta}
	seqnum=`grep -c '^>' $IN_DIR/$FILE`
	echo $SAMPLE Seq-num=$seqnum
	if [ $seqnum -ge 1 ]
	then
		echo -e "\nStart Blastn search analysis for :"$SAMPLE
	../../Tools/ncbi-blast-2.2.31+/bin/blastn -query $FNAME -db $DB -max_target_seqs 10 -perc_identity 80 -evalue 0.0001 -outfmt "7 sseqid pident length mismatch gapopen evalue bitscore qseq" -out $OUT_DIR/$SAMPLE.97nohits_blastn_res.txt -html
	else
		echo -e "\nNo 97%nohit seqs in :"$SAMPLE
	fi
done

echo -e "\nBlastn search analysis finished"
