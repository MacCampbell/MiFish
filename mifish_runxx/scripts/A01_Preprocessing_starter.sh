#!/bin/bash

./J01_Fastqc.sh
./J02_TailTrimming.sh
./J03_PE_read_assembly.sh
./J04_RemoveN.sh
./J05_Length_check_MiFish.sh
./J06_Primer_removal_MiFish.sh
./J07_Processed_read_counter.sh
./J09_Temporary_files_removal_01.sh
