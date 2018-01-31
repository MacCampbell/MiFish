#!/bin/bash
#$ -S /bin/sh

IN_DIR0="../3_2_BlastnRes_counts/parsedfiles"
IN_DIR="../5_2_Fasta_from_Each_samples"
OUT_DIR1="../6_1_Merged_phylogeny"
OUT_DIR2="../6_1_Merged_phylogeny/for_morphy"
SCRIPT="../../Parsers"
MORPHY="../../Tools/molphy-2.3b3"

rm -rf $OUT_DIR1
mkdir $OUT_DIR1
rm -rf $OUT_DIR2
mkdir $OUT_DIR2

for FNAME in $IN_DIR0/*.blastn.deprep.list.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.deprep.list.txt}

	cat $IN_DIR/$SAMPLE/*.fa > $OUT_DIR1/$SAMPLE.merged.fa
	perl $SCRIPT/mfasta_name_encoder.pl $OUT_DIR1/$SAMPLE.merged.fa $OUT_DIR2
	
	mafft $OUT_DIR1/$SAMPLE.merged.fa > $OUT_DIR1/$SAMPLE.merged.aln.fa
	mafft --clustalout $OUT_DIR2/$SAMPLE.merged.fa.clu.fa > $OUT_DIR2/$SAMPLE.merged.aln.clu.fa

	$MORPHY/clus2mol $OUT_DIR2/$SAMPLE.merged.aln.clu.fa > $OUT_DIR2/$SAMPLE.merged.mol
	$MORPHY/src/nucml -D -p $OUT_DIR2/$SAMPLE.merged.mol > $OUT_DIR2/$SAMPLE.merged.mol.D
	$MORPHY/src/njdist -w -T $OUT_DIR2/$SAMPLE.merged $OUT_DIR2/$SAMPLE.merged.mol.D
	
	perl $SCRIPT/mfasta_name_decoder.pl $OUT_DIR2/$SAMPLE.merged.fa.names.txt $OUT_DIR2/$SAMPLE.merged.tre > $OUT_DIR2/$SAMPLE.merged.fin.tre 
done

mkdir $OUT_DIR1/Morphy_Trees
cp $OUT_DIR2/*fin.tre $OUT_DIR1/Morphy_Trees

rm ./*eps
rm ./*tpl
