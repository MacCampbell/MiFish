#!/bin/bash
#$ -S /bin/sh

IN_DIR1="../3_2_BlastnRes_counts"
IN_DIR2="../2_1_Uclust"
OUT_DIR1="../8_1_97nohits_fas"
SCRIPT="../../Parsers"

rm -rf $OUT_DIR1
mkdir $OUT_DIR1

# $FNAME はフルパス
# $FILE はファイル名
# $SAMPLE はサンプル名

for FNAME in $IN_DIR1/*.blastn.deprep.counts.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.deprep.counts.txt}
	echo -e "Processing sample: " $SAMPLE
	perl $SCRIPT/blastnohit_to_fasta.pl $IN_DIR1/$FILE $IN_DIR2/$SAMPLE.sizetrim.sum.fasta > $OUT_DIR1/$SAMPLE.97nohits.fasta
done
