#!/bin/bash
#$ -S /bin/sh

IN_DIR="../8_3_97nohits_BlastnRes_counts"
OUT_DIR="../Portal_97no_html_files"
SCRIPT="../../Parsers"

rm -rf $OUT_DIR
mkdir $OUT_DIR

for FNAME in $IN_DIR/*blastn.LODlist.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.LODlist.txt}
	echo -e $SAMPLE ": portal html generating"
	mkdir $OUT_DIR/$SAMPLE
	perl $SCRIPT/Html_portal_parser_LODS_97no.pl $IN_DIR/$SAMPLE.blastn.deprep.counts.txt $FNAME $OUT_DIR/$SAMPLE
done
