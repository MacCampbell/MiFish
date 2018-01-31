#!/bin/bash
#$ -S /bin/sh

IN_DIR="../4_1_Allsamples_specieslist"
OUT_DIR="../Portal_html_files"
SCRIPT="../../Parsers"

CDIR=`pwd`
RUNDIR=${CDIR%/scripts}
RUNNAME=${RUNDIR##*/}

OUTFILENAME=$RUNNAME".splist.html"
rm -f $OUT_DIR/$OUTFILENAME

echo -e "<html>" >> $OUT_DIR/$OUTFILENAME
echo -e "<head>" >> $OUT_DIR/$OUTFILENAME
echo -e "<meta http-equiv=\"Content-type\" content=\"text/html\" charset=\"Shift_JIS\">" >> $OUT_DIR/$OUTFILENAME
echo -e "<title>$RUNNAME_splist</title>" >> $OUT_DIR/$OUTFILENAME
echo -e "<style type=\"text/css\">" >> $OUT_DIR/$OUTFILENAME
echo -e "H1{color: #ffffff; text-align: left; font: 100% Tahoma;}" >> $OUT_DIR/$OUTFILENAME
echo -e "H2{color: #000000; text-align: left; font: 100% Tahoma;}" >> $OUT_DIR/$OUTFILENAME
echo -e "H3{text-align: left; font: 100% Tahoma; line-height: 4px;}" >> $OUT_DIR/$OUTFILENAME
echo -e "</style>" >> $OUT_DIR/$OUTFILENAME
echo -e "</head>" >> $OUT_DIR/$OUTFILENAME
echo -e "<body bgcolor=\"#EFEFFB\">" >> $OUT_DIR/$OUTFILENAME
echo -e "<a name=\"top\"></a>" >> $OUT_DIR/$OUTFILENAME
echo -e "<font face=\"Tahoma\" size=\"5\">$RUNNAME: species list from all samples</font><BR><BR>" >> $OUT_DIR/$OUTFILENAME
echo -e "<table>" >> $OUT_DIR/$OUTFILENAME
echo -e "<table border=\"0\" cellspacing=\"1\" bgcolor=\"#191970\" border=\"1\" align=\"left\">" >> $OUT_DIR/$OUTFILENAME

perl $SCRIPT/Html_portal_splist.pl $IN_DIR/allsamples_specieslist.txt >> $OUT_DIR/$OUTFILENAME

echo -e "<BR>" >> $OUT_DIR/$OUTFILENAME
#echo -e "<a href="#top"><font face=\"Tahoma\">Back to top<font></a>" >> $OUT_DIR/$OUTFILENAME
echo -e "</body>" >> $OUT_DIR/$OUTFILENAME
echo -e "</html>" >> $OUT_DIR/$OUTFILENAME
