#!/bin/bash
#$ -S /bin/sh

IN_DIR0="../3_2_BlastnRes_counts/parsedfiles"
IN_DIR1="../5_2_Fasta_from_Each_samples"
IN_DIR2="../5_2_Fasta_from_Each_samples/for_morphy"
OUT_DIR1="../5_4_Alignment_from_Each_samples"
OUT_DIR2="../5_4_Alignment_from_Each_samples/for_morphy"
MAFFT="/usr/local/bin/mafft"

rm -rf $OUT_DIR1
mkdir $OUT_DIR1
rm -rf $OUT_DIR2
mkdir $OUT_DIR2

for FNAME in $IN_DIR0/*.blastn.deprep.list.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.deprep.list.txt}
	mkdir $OUT_DIR1/$SAMPLE
	
	for FASTAS in $IN_DIR1/$SAMPLE/*.fa
	do
		FASTA=${FASTAS##*/}
		$MAFFT $IN_DIR1/$SAMPLE/$FASTA > $OUT_DIR1/$SAMPLE/$FASTA.aln.fa
	done
done

for FNAME in $IN_DIR0/*.blastn.deprep.list.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.deprep.list.txt}
	mkdir $OUT_DIR2/$SAMPLE
	
	for FASTAS in $IN_DIR2/$SAMPLE/*.fa.clu.fa
	do
		FASTA=${FASTAS##*/}
		$MAFFT --clustalout $IN_DIR2/$SAMPLE/$FASTA > $OUT_DIR2/$SAMPLE/$FASTA.aln.clu.fa
	done
done
