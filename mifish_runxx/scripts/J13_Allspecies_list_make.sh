#!/bin/bash
#$ -S /bin/sh

IN_DIR="../3_2_BlastnRes_counts"
OUT_DIR="../4_1_Allsamples_specieslist"

rm -rf $OUT_DIR
mkdir $OUT_DIR

for FNAME in $IN_DIR/*.blastn.LODlist.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.LODlist.txt}
	less -f $IN_DIR/$FILE | awk -F "\t" '{print $2}' >> $OUT_DIR/allsamples_specieslist.temp.txt
done

less -f $OUT_DIR/allsamples_specieslist.temp.txt | grep -v '^No hits found.*' | sort | uniq > $OUT_DIR/allsamples_specieslist.txt
rm -f $OUT_DIR/allsamples_specieslist.temp.txt
