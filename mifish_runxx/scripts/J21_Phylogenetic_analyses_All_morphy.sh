#!/bin/bash
#$ -S /bin/sh

IN_DIR="../5_3_Alignment_from_All_samples/for_morphy"
IN_DIR2="../5_1_Fasta_from_All_samples/for_morphy"
OUT_DIR0="../5_5_Phylogenetic_analyses_All"
OUT_DIR="../5_5_Phylogenetic_analyses_All/morphy"
OUT_DIR2="../5_5_Phylogenetic_analyses_All/morphy_trees"
SCRIPT="../../Parsers"
MORPHY="../../Tools/molphy-2.3b3"

rm -rf $OUT_DIR0
mkdir $OUT_DIR0
rm -rf $OUT_DIR
mkdir $OUT_DIR
rm -rf $OUT_DIR2
mkdir $OUT_DIR2

for FNAME in $IN_DIR/*aln.clu.fa
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.aln.clu.fa}
	$MORPHY/clus2mol $IN_DIR/$FILE > $OUT_DIR/$SAMPLE.mol
	$MORPHY/src/nucml -D -p $OUT_DIR/$SAMPLE.mol > $OUT_DIR/$SAMPLE.mol.D
	$MORPHY/src/njdist -w -T $OUT_DIR/$SAMPLE $OUT_DIR/$SAMPLE.mol.D
	perl $SCRIPT/mfasta_name_decoder.pl $IN_DIR2/$SAMPLE.fa.names.txt $OUT_DIR/$SAMPLE.tre > $OUT_DIR2/$SAMPLE.fin.tre 
done

rm ./*eps
rm ./*tpl
