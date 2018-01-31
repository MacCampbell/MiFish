#!/bin/bash
#$ -S /bin/sh

IN_DIR="../8_2_97nohits_BlastnRes"
OUT_DIR1="../8_3_97nohits_BlastnRes_counts"
OUT_DIR2="../8_3_97nohits_BlastnRes_counts/parsedfiles"
SCRIPT="../../Parsers"

rm -rf $OUT_DIR1
rm -rf $OUT_DIR2
mkdir $OUT_DIR1
mkdir $OUT_DIR2

for FNAME in $IN_DIR/*.97nohits_blastn_res.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.97nohits_blastn_res.txt}
	date +"%Y/%m/%d %H:%M:%S"
	
	echo -e "\nParsing BlastnRes file of "$SAMPLE
	perl $SCRIPT/blastres_parser_97no.pl $IN_DIR/$FILE > $OUT_DIR2/$SAMPLE.blastn.deprep.list.txt
	
	echo -e "\nListing the results of "$SAMPLE
	perl $SCRIPT/blastres_parse_counter_97no.pl $OUT_DIR2/$SAMPLE.blastn.deprep.list.txt > $OUT_DIR1/$SAMPLE.blastn.deprep.counts.txt
	
	echo -e "\nCalculating LOD scores of "$SAMPLE
	perl $SCRIPT/blastres_parser_LODs_97no.pl $IN_DIR/$FILE > $OUT_DIR1/$SAMPLE.blastn.LODlist.txt
	
	echo -e "\nAdding Japanese names to the list of "$SAMPLE
	perl $SCRIPT/BlastnRes.counts_JapaneseNameAddition_97no.pl $OUT_DIR1/$SAMPLE.blastn.deprep.counts.txt $SCRIPT/Sname_Jname.togodb.nonredundant.txt > $OUT_DIR1/$SAMPLE.blastn.JPnames.deprep.txt
done