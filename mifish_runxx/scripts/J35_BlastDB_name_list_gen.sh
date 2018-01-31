#!/bin/bash
#$ -S /bin/sh

IN_DIR="../../BlastDB"
OUT_DIR="../"

echo -e "Generating BlastDB species list\n"

echo "MiFish_DB_v23 Database species list: \n" >> $OUT_DIR/BlastDB_name_list.txt
less $IN_DIR/*.fa | grep "^>" | sed 's/.*|//' | sed 's/_/ /' | sort | uniq >> $OUT_DIR/BlastDB_name_list.txt


echo -e "Analyses finished\n"






