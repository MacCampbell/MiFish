#!/bin/bash
#$ -S /bin/sh

IN_DIR1="../3_2_BlastnRes_counts"
SCRIPT="../../Parsers"

CDIR=`pwd`
RUNDIR=${CDIR%/scripts}
RUNNAME=${RUNDIR##*/}

OUTFILENAME=$RUNNAME"_Portal.html"
rm -f ../$OUTFILENAME

date +"%Y/%m/%d %H:%M:%S"
echo -e "\nMaking portal.html"

echo -e "<html>" >> ../$OUTFILENAME
echo -e "<head>" >> ../$OUTFILENAME
echo -e "<meta http-equiv=\"Content-type\" content=\"text/html\" charset=\"Shift_JIS\">" >> ../$OUTFILENAME
echo -e "<title>$RUNNAME_portal</title>" >> ../$OUTFILENAME
echo -e "<style type=\"text/css\">" >> ../$OUTFILENAME
echo -e "H1{color: #ffffff; text-align: left; font: 100% Tahoma;}" >> ../$OUTFILENAME
echo -e "H2{color: #000000; text-align: left; font: 100% Tahoma;}" >> ../$OUTFILENAME
echo -e "H3{text-align: left; font: 100% Tahoma; line-height: 4px;}" >> ../$OUTFILENAME
echo -e "</style>" >> ../$OUTFILENAME
echo -e "</head>" >> ../$OUTFILENAME
echo -e "<body bgcolor=\"#EFEFFB\">" >> ../$OUTFILENAME
echo -e "<a name=\"top\"></a>" >> ../$OUTFILENAME
echo -e "<font face=\"Tahoma\" size=\"6\">$RUNNAME Blastn >97% portal</font><BR>" >> ../$OUTFILENAME
echo -e "<H2><a href=\"Portal_html_files/$RUNNAME.splist.html\">List of species and phylogenetic trees</a> (merged from all samples)</H2>" >> ../$OUTFILENAME
echo -e "<H2>Samples analyzed:</H2>" >> ../$OUTFILENAME

for FNAME in $IN_DIR1/*.blastn.JPnames.deprep.txt
do
	FILE=${FNAME##*/}
	SAMPLE=${FILE%.blastn.JPnames.deprep.txt}
	echo -e "<a href="#$SAMPLE"><H3>$SAMPLE</H3></a>" >> ../$OUTFILENAME
done

echo -e "<br><br>" >> ../$OUTFILENAME

for FNAME in $IN_DIR1/*.blastn.JPnames.deprep.txt
do
	FILE=${FNAME##*/}
	perl $SCRIPT/Html_portal_parser.pl $IN_DIR1/$FILE >> ../$OUTFILENAME
	echo -e "<a href="#top"><font face=\"Tahoma\">Back to list<font></a>" >> ../$OUTFILENAME
	echo -e "<br><br>" >> ../$OUTFILENAME
done

echo -e "</body>" >> ../$OUTFILENAME
echo -e "</html>" >> ../$OUTFILENAME
