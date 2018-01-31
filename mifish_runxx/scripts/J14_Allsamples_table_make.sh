#!/bin/bash
#$ -S /bin/sh

IN_DIR01="../3_2_BlastnRes_counts"
IN_DIR02="../4_1_Allsamples_specieslist"
OUT_DIR="../4_2_Allsamples_speciescnt_table"

SCRIPT="../../Parsers"

rm -rf $OUT_DIR
mkdir $OUT_DIR

perl $SCRIPT/allsamples_nameprinter_v1.pl $IN_DIR02/allsamples_specieslist.txt >> $OUT_DIR/Allsamples.speciescnt_table.tsv

date +"%Y/%m/%d %H:%M:%S"
echo -e "\nMaking species by read-counts table"

for FNAME in $IN_DIR01/*deprep.counts.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.deprep.counts.txt}
	perl $SCRIPT/allsamples_species.counter_v2.pl $IN_DIR01/$FILE $IN_DIR02/allsamples_specieslist.txt >> $OUT_DIR/Allsamples.speciescnt_table.tsv
done

echo -e "\nAnalysis finished: see Path/to/your/Run/4_2_Allsamples_speciescnt_table/Allsamples.speciescnt_table.tsv"
