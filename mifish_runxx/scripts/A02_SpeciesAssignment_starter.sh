#!/bin/bash

./J10_Uclust_derep_trim.sh
./J11_Blastn.sh
./J12_Blastres_counts_deprep.sh
./J13_Allspecies_list_make.sh
./J14_Allsamples_table_make.sh
