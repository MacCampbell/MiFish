#!/bin/bash

./J15_Fasta_from_All_samples.sh
./J16_Fasta_decode_All_for_morphy.sh
./J17_Fasta_from_Each_samples.sh
./J18_Fasta_decode_Each_for_morphy.sh
./J19_Alignment_from_All_samples.sh
./J20_Alignment_from_Each_samples.sh
./J24_PortalHtml.sh
./J25_PortalHtml_sub.sh
./J26_PortalHtml_splist.sh
./J27_Temporary_files_removal_01.sh
./J27_Temporary_files_removal_02.sh
./J30_Blastnohits_fas.sh
./J31_Blastnohits_blastn.sh
./J32_Blastnohits_res_counts.sh
./J33_Blastnohits_portal.sh
./J34_Blastnohits_portall_sub.sh
./J35_BlastDB_name_list_gen.sh