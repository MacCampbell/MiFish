/*
 * dyhfjtt.c   Adachi, J.   1995.09.07
 * Copyright (C) 1992-1995 J. Adachi & M. Hasegawa, All rights reserved.
 */

#include "protml.h"

void 
dyhfjtt(r, f, flag) /* Data of Amino Acid Substitution Model */
	dmattpmty r;    /* Relative Substitution Rate Matrix */
	double *f;      /* Frequency */
	boolean flag;   /* TRUE(1) : Dayhoff,  FALSE(0) : JTT */
{
	int i, j;

	/* Dayhoff's model data
	 * Dayhoff, M.O., Schwartz, R.M., Orcutt, B.C. (1978)
	 * "A model of evolutionary change in proteins."
	 * Dayhoff, M.O.(ed.) Atlas of Protein Sequence Structur., Vol5, Suppl3.
	 * National Biomedical Research Foundation, Washington DC, pp.345-352.
	 */

	/* JTT's model data
	 * D.T.Jones, W.R.Taylor and J.M.Thornton
	 * "The rapid generation of mutation data matrices from protein sequences"
	 * CABIOS  vol.8 no.3 1992 pp275-282
	 */

	/* Upper triangular is Dayhoff's Accepted point mutations */
	/* Lower triangular is JTT's Accepted point mutations */
	r[ 0][ 0]=    0; r[ 0][ 1]=   30; r[ 0][ 2]=  109; r[ 0][ 3]=  154;
	r[ 0][ 4]=   33; r[ 0][ 5]=   93; r[ 0][ 6]=  266; r[ 0][ 7]=  579;
	r[ 0][ 8]=   21; r[ 0][ 9]=   66; r[ 0][10]=   95; r[ 0][11]=   57;
	r[ 0][12]=   29; r[ 0][13]=   20; r[ 0][14]=  345; r[ 0][15]=  772;
	r[ 0][16]=  590; r[ 0][17]=    0; r[ 0][18]=   20; r[ 0][19]=  365;
	r[ 1][ 0]=  247; r[ 1][ 1]=    0; r[ 1][ 2]=   17; r[ 1][ 3]=    0;
	r[ 1][ 4]=   10; r[ 1][ 5]=  120; r[ 1][ 6]=    0; r[ 1][ 7]=   10;
	r[ 1][ 8]=  103; r[ 1][ 9]=   30; r[ 1][10]=   17; r[ 1][11]=  477;
	r[ 1][12]=   17; r[ 1][13]=    7; r[ 1][14]=   67; r[ 1][15]=  137;
	r[ 1][16]=   20; r[ 1][17]=   27; r[ 1][18]=    3; r[ 1][19]=   20;
	r[ 2][ 0]=  216; r[ 2][ 1]=  116; r[ 2][ 2]=    0; r[ 2][ 3]=  532;
	r[ 2][ 4]=    0; r[ 2][ 5]=   50; r[ 2][ 6]=   94; r[ 2][ 7]=  156;
	r[ 2][ 8]=  226; r[ 2][ 9]=   36; r[ 2][10]=   37; r[ 2][11]=  322;
	r[ 2][12]=    0; r[ 2][13]=    7; r[ 2][14]=   27; r[ 2][15]=  432;
	r[ 2][16]=  169; r[ 2][17]=    3; r[ 2][18]=   36; r[ 2][19]=   13;
	r[ 3][ 0]=  386; r[ 3][ 1]=   48; r[ 3][ 2]= 1433; r[ 3][ 3]=    0;
	r[ 3][ 4]=    0; r[ 3][ 5]=   76; r[ 3][ 6]=  831; r[ 3][ 7]=  162;
	r[ 3][ 8]=   43; r[ 3][ 9]=   13; r[ 3][10]=    0; r[ 3][11]=   85;
	r[ 3][12]=    0; r[ 3][13]=    0; r[ 3][14]=   10; r[ 3][15]=   98;
	r[ 3][16]=   57; r[ 3][17]=    0; r[ 3][18]=    0; r[ 3][19]=   17;
	r[ 4][ 0]=  106; r[ 4][ 1]=  125; r[ 4][ 2]=   32; r[ 4][ 3]=   13;
	r[ 4][ 4]=    0; r[ 4][ 5]=    0; r[ 4][ 6]=    0; r[ 4][ 7]=   10;
	r[ 4][ 8]=   10; r[ 4][ 9]=   17; r[ 4][10]=    0; r[ 4][11]=    0;
	r[ 4][12]=    0; r[ 4][13]=    0; r[ 4][14]=   10; r[ 4][15]=  117;
	r[ 4][16]=   10; r[ 4][17]=    0; r[ 4][18]=   30; r[ 4][19]=   33;
	r[ 5][ 0]=  208; r[ 5][ 1]=  750; r[ 5][ 2]=  159; r[ 5][ 3]=  130;
	r[ 5][ 4]=    9; r[ 5][ 5]=    0; r[ 5][ 6]=  422; r[ 5][ 7]=   30;
	r[ 5][ 8]=  243; r[ 5][ 9]=    8; r[ 5][10]=   75; r[ 5][11]=  147;
	r[ 5][12]=   20; r[ 5][13]=    0; r[ 5][14]=   93; r[ 5][15]=   47;
	r[ 5][16]=   37; r[ 5][17]=    0; r[ 5][18]=    0; r[ 5][19]=   27;
	r[ 6][ 0]=  600; r[ 6][ 1]=  119; r[ 6][ 2]=  180; r[ 6][ 3]= 2914;
	r[ 6][ 4]=    8; r[ 6][ 5]= 1027; r[ 6][ 6]=    0; r[ 6][ 7]=  112;
	r[ 6][ 8]=   23; r[ 6][ 9]=   35; r[ 6][10]=   15; r[ 6][11]=  104;
	r[ 6][12]=    7; r[ 6][13]=    0; r[ 6][14]=   40; r[ 6][15]=   86;
	r[ 6][16]=   31; r[ 6][17]=    0; r[ 6][18]=   10; r[ 6][19]=   37;
	r[ 7][ 0]= 1183; r[ 7][ 1]=  614; r[ 7][ 2]=  291; r[ 7][ 3]=  577;
	r[ 7][ 4]=   98; r[ 7][ 5]=   84; r[ 7][ 6]=  610; r[ 7][ 7]=    0;
	r[ 7][ 8]=   10; r[ 7][ 9]=    0; r[ 7][10]=   17; r[ 7][11]=   60;
	r[ 7][12]=    7; r[ 7][13]=   17; r[ 7][14]=   49; r[ 7][15]=  450;
	r[ 7][16]=   50; r[ 7][17]=    0; r[ 7][18]=    0; r[ 7][19]=   97;
	r[ 8][ 0]=   46; r[ 8][ 1]=  446; r[ 8][ 2]=  466; r[ 8][ 3]=  144;
	r[ 8][ 4]=   40; r[ 8][ 5]=  635; r[ 8][ 6]=   41; r[ 8][ 7]=   41;
	r[ 8][ 8]=    0; r[ 8][ 9]=    3; r[ 8][10]=   40; r[ 8][11]=   23;
	r[ 8][12]=    0; r[ 8][13]=   20; r[ 8][14]=   50; r[ 8][15]=   26;
	r[ 8][16]=   14; r[ 8][17]=    3; r[ 8][18]=   40; r[ 8][19]=   30;
	r[ 9][ 0]=  173; r[ 9][ 1]=   76; r[ 9][ 2]=  130; r[ 9][ 3]=   37;
	r[ 9][ 4]=   19; r[ 9][ 5]=   20; r[ 9][ 6]=   43; r[ 9][ 7]=   25;
	r[ 9][ 8]=   26; r[ 9][ 9]=    0; r[ 9][10]=  253; r[ 9][11]=   43;
	r[ 9][12]=   57; r[ 9][13]=   90; r[ 9][14]=    7; r[ 9][15]=   20;
	r[ 9][16]=  129; r[ 9][17]=    0; r[ 9][18]=   13; r[ 9][19]=  661;
	r[10][ 0]=  257; r[10][ 1]=  205; r[10][ 2]=   63; r[10][ 3]=   34;
	r[10][ 4]=   36; r[10][ 5]=  314; r[10][ 6]=   65; r[10][ 7]=   56;
	r[10][ 8]=  134; r[10][ 9]= 1324; r[10][10]=    0; r[10][11]=   39;
	r[10][12]=  207; r[10][13]=  167; r[10][14]=   43; r[10][15]=   32;
	r[10][16]=   52; r[10][17]=   13; r[10][18]=   23; r[10][19]=  303;
	r[11][ 0]=  200; r[11][ 1]= 2348; r[11][ 2]=  758; r[11][ 3]=  102;
	r[11][ 4]=    7; r[11][ 5]=  858; r[11][ 6]=  754; r[11][ 7]=  142;
	r[11][ 8]=   85; r[11][ 9]=   75; r[11][10]=   94; r[11][11]=    0;
	r[11][12]=   90; r[11][13]=    0; r[11][14]=   43; r[11][15]=  168;
	r[11][16]=  200; r[11][17]=    0; r[11][18]=   10; r[11][19]=   17;
	r[12][ 0]=  100; r[12][ 1]=   61; r[12][ 2]=   39; r[12][ 3]=   27;
	r[12][ 4]=   23; r[12][ 5]=   52; r[12][ 6]=   30; r[12][ 7]=   27;
	r[12][ 8]=   21; r[12][ 9]=  704; r[12][10]=  974; r[12][11]=  103;
	r[12][12]=    0; r[12][13]=   17; r[12][14]=    4; r[12][15]=   20;
	r[12][16]=   28; r[12][17]=    0; r[12][18]=    0; r[12][19]=   77;
	r[13][ 0]=   51; r[13][ 1]=   16; r[13][ 2]=   15; r[13][ 3]=    8;
	r[13][ 4]=   66; r[13][ 5]=    9; r[13][ 6]=   13; r[13][ 7]=   18;
	r[13][ 8]=   50; r[13][ 9]=  196; r[13][10]= 1093; r[13][11]=    7;
	r[13][12]=   49; r[13][13]=    0; r[13][14]=    7; r[13][15]=   40;
	r[13][16]=   10; r[13][17]=   10; r[13][18]=  260; r[13][19]=   10;
	r[14][ 0]=  901; r[14][ 1]=  217; r[14][ 2]=   31; r[14][ 3]=   39;
	r[14][ 4]=   15; r[14][ 5]=  395; r[14][ 6]=   71; r[14][ 7]=   93;
	r[14][ 8]=  157; r[14][ 9]=   31; r[14][10]=  578; r[14][11]=   77;
	r[14][12]=   23; r[14][13]=   36; r[14][14]=    0; r[14][15]=  269;
	r[14][16]=   73; r[14][17]=    0; r[14][18]=    0; r[14][19]=   50;
	r[15][ 0]= 2413; r[15][ 1]=  413; r[15][ 2]= 1738; r[15][ 3]=  244;
	r[15][ 4]=  353; r[15][ 5]=  182; r[15][ 6]=  156; r[15][ 7]= 1131;
	r[15][ 8]=  138; r[15][ 9]=  172; r[15][10]=  436; r[15][11]=  228;
	r[15][12]=   54; r[15][13]=  309; r[15][14]= 1138; r[15][15]=    0;
	r[15][16]=  696; r[15][17]=   17; r[15][18]=   22; r[15][19]=   43;
	r[16][ 0]= 2440; r[16][ 1]=  230; r[16][ 2]=  693; r[16][ 3]=  151;
	r[16][ 4]=   66; r[16][ 5]=  149; r[16][ 6]=  142; r[16][ 7]=  164;
	r[16][ 8]=   76; r[16][ 9]=  930; r[16][10]=  172; r[16][11]=  398;
	r[16][12]=  343; r[16][13]=   39; r[16][14]=  412; r[16][15]= 2258;
	r[16][16]=    0; r[16][17]=    0; r[16][18]=   23; r[16][19]=  186;
	r[17][ 0]=   11; r[17][ 1]=  109; r[17][ 2]=    2; r[17][ 3]=    5;
	r[17][ 4]=   38; r[17][ 5]=   12; r[17][ 6]=   12; r[17][ 7]=   69;
	r[17][ 8]=    5; r[17][ 9]=   12; r[17][10]=   82; r[17][11]=    9;
	r[17][12]=    8; r[17][13]=   37; r[17][14]=    6; r[17][15]=   36;
	r[17][16]=    8; r[17][17]=    0; r[17][18]=    6; r[17][19]=    0;
	r[18][ 0]=   41; r[18][ 1]=   46; r[18][ 2]=  114; r[18][ 3]=   89;
	r[18][ 4]=  164; r[18][ 5]=   40; r[18][ 6]=   15; r[18][ 7]=   15;
	r[18][ 8]=  514; r[18][ 9]=   61; r[18][10]=   84; r[18][11]=   20;
	r[18][12]=   17; r[18][13]=  850; r[18][14]=   22; r[18][15]=  164;
	r[18][16]=   45; r[18][17]=   41; r[18][18]=    0; r[18][19]=   17;
	r[19][ 0]= 1766; r[19][ 1]=   69; r[19][ 2]=   55; r[19][ 3]=  127;
	r[19][ 4]=   99; r[19][ 5]=   58; r[19][ 6]=  226; r[19][ 7]=  276;
	r[19][ 8]=   22; r[19][ 9]= 3938; r[19][10]= 1261; r[19][11]=   58;
	r[19][12]=  559; r[19][13]=  189; r[19][14]=   84; r[19][15]=  219;
	r[19][16]=  526; r[19][17]=   27; r[19][18]=   42; r[19][19]=    0;

	if (flag) { /* Dayhoff */

		/* Amino Acid Frequency of Dayhoff model */
		f[ 0] = 0.087; f[ 1] = 0.041; f[ 2] = 0.040; f[ 3] = 0.047;
		f[ 4] = 0.033; f[ 5] = 0.038; f[ 6] = 0.05;  f[ 7] = 0.089;
		f[ 8] = 0.034; f[ 9] = 0.037; f[10] = 0.085; f[11] = 0.08;
		f[12] = 0.015; f[13] = 0.04;  f[14] = 0.051; f[15] = 0.07;
		f[16] = 0.058; f[17] = 0.01;  f[18] = 0.03;  f[19] = 0.065;
		/* f[11] != 0.081, because f[0] + f[1] + ... + f[19] = 1.01 */

		/* Relative Substitution Rate Matrix of Dayhoff model */
		for (i = 0; i < 20 - 1; i++) {
			for (j = i + 1; j < 20; j++) {
				if (r[i][j] == 0.0) {
					r[i][j] = r[j][i] * (1572.0 / 59190.0);
					if (r[i][j] > 1.0) r[i][j] = 1.0;
				}
				r[i][j] /= 400.0 * f[i] * f[j];
				r[j][i] = r[i][j];
			}
		}

	} else { /* JTT */

		/* Amino Acid Frequency of JTT model */
		f[ 0] = 0.077; f[ 1] = 0.051; f[ 2] = 0.043; f[ 3] = 0.052;
		f[ 4] = 0.02;  f[ 5] = 0.041; f[ 6] = 0.062; f[ 7] = 0.074;
		f[ 8] = 0.023; f[ 9] = 0.052; f[10] = 0.091; f[11] = 0.059;
		f[12] = 0.024; f[13] = 0.04;  f[14] = 0.051; f[15] = 0.069;
		f[16] = 0.059; f[17] = 0.014; f[18] = 0.032; f[19] = 0.066;
		/* f[9] != 0.053, because f[0] + f[1] + ... + f[19] = 1.01 */

		/* Relative Substitution Rate Matrix of JTT model */
		for (i = 1; i < 20; i++) {
			for (j = 0; j < i; j++) {
				r[i][j] /= 400.0 * f[i] * f[j];
				r[j][i] = r[i][j];
			}
		}

	}

} /*_ dyhfjtt */
