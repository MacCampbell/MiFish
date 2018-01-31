#!/bin/bash
#$ -S /bin/sh

IN_DIR1="../5_1_Fasta_from_All_samples"
IN_DIR2="../5_2_Fasta_from_Each_samples"
IN_DIR3="../5_3_Alignment_from_All_samples"
IN_DIR4="../5_4_Alignment_from_Each_samples"
IN_DIR5="../5_5_Phylogenetic_analyses_All"
IN_DIR6="../5_6_Phylogenetic_analyses_Each"
IN_DIR7="../6_1_Merged_phylogeny"

date +"%Y/%m/%d %H:%M:%S"
echo -e "\nRemoving temporary files"

rm -rf $IN_DIR1/for_morphy
rm -rf $IN_DIR2/for_morphy
rm -rf $IN_DIR3/for_morphy
rm -rf $IN_DIR4/for_morphy
rm -rf $IN_DIR5/morphy
rm -rf $IN_DIR6/morphy/*/*.mol
rm -rf $IN_DIR6/morphy/*/*.mol.D
rm -rf $IN_DIR7/for_morphy

date +"%Y/%m/%d %H:%M:%S"
echo -e "\nTemporal-files removal finished"
