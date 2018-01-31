#!/bin/bash
#$ -S /bin/sh

IN_DIR0="../3_2_BlastnRes_counts/parsedfiles"
IN_DIR="../5_4_Alignment_from_Each_samples/for_morphy"
IN_DIR2="../5_2_Fasta_from_Each_samples/for_morphy"
OUT_DIR0="../5_6_Phylogenetic_analyses_Each"
OUT_DIR="../5_6_Phylogenetic_analyses_Each/morphy"

SCRIPT="../../Parsers"
MORPHY="../../Tools/molphy-2.3b3"

rm -rf $OUT_DIR0
mkdir $OUT_DIR0
rm -rf $OUT_DIR
mkdir $OUT_DIR

for FNAME in $IN_DIR0/*.blastn.deprep.list.txt
	
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.deprep.list.txt}
	mkdir $OUT_DIR/$SAMPLE
	
	for FASTAS in $IN_DIR/$SAMPLE/*.aln.clu.fa
	do
		FASTA=${FASTAS##*/}
		FAS=${FASTA%.fa.clu.fa.aln.clu.fa}
		$MORPHY/clus2mol $IN_DIR/$SAMPLE/$FASTA > $OUT_DIR/$SAMPLE/$FAS.mol
		$MORPHY/src/nucml -D -p $OUT_DIR/$SAMPLE/$FAS.mol > $OUT_DIR/$SAMPLE/$FAS.mol.D
		$MORPHY/src/njdist -w -T $OUT_DIR/$SAMPLE/$FAS $OUT_DIR/$SAMPLE/$FAS.mol.D
		perl $SCRIPT/mfasta_name_decoder.pl $IN_DIR2/$SAMPLE/$FAS.fa.names.txt $OUT_DIR/$SAMPLE/$FAS.tre > $OUT_DIR/$SAMPLE/$FAS.fin.tre 
	done
done

rm ./*eps
rm ./*tpl
