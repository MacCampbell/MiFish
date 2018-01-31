#!/bin/bash

IN_DIR="../data"
OUT_DIR="../1_2_TailTrimming"
SCRIPT="../../Tools/DynamicTrim.pl"

rm -rf $OUT_DIR
mkdir $OUT_DIR

for FNAME in $IN_DIR/*fastq
do
    FILE=${FNAME##*/}
    echo -e "\n"
    date +"%Y/%m/%d %H:%M:%S"
    echo -e "Starting low-quality tail trimming of" $FILE
    # Specify the threshold Phred score at the option -h
    perl $SCRIPT $FNAME -h 10 -d $OUT_DIR
    echo -e "Tail trimming finished\n"
done
