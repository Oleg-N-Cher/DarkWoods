/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "DW2Config.h"
#include "GrFonts.h"
#include "DW2Rsrc.h"
#include "Console.h"
#include "GrTiles.h"




export void SemiAction_MainMenu (void);


void SemiAction_MainMenu (void)
{
	SHORTINT cor, _for__3, _for__2;
	Console_Clear(0);
	Console_SetFont(GrFonts_ZxSpecRom8x8, 768);
	Console_SetColors(15);
	Console_WriteStr((CHAR*)" DarkWoods Port ", (LONGINT)17);
	Console_SetColors(41);
	Console_WriteStr((CHAR*)" VEDAsoft \'2013 ", (LONGINT)17);
	Console_SetFont(GrFonts_MsDosCga8x8, 768);
	Console_SetColors(36);
	Console_At(3, 2);
	Console_WriteStr((CHAR*)"       ", (LONGINT)8);
	Console_At(2, 3);
	Console_WriteStr((CHAR*)"  ", (LONGINT)3);
	Console_At(5, 3);
	Console_WriteStr((CHAR*)"   ", (LONGINT)4);
	Console_At(9, 3);
	Console_WriteStr((CHAR*)"  ", (LONGINT)3);
	Console_At(1, 4);
	Console_WriteStr((CHAR*)"           ", (LONGINT)12);
	Console_At(2, 5);
	Console_WriteStr((CHAR*)"         ", (LONGINT)10);
	Console_At(4, 6);
	Console_WriteStr((CHAR*)"  ", (LONGINT)3);
	Console_At(7, 6);
	Console_WriteStr((CHAR*)"  ", (LONGINT)3);
	Console_At(4, 7);
	Console_WriteStr((CHAR*)"     ", (LONGINT)6);
	Console_At(4, 10);
	Console_WriteStr((CHAR*)"     ", (LONGINT)6);
	Console_At(5, 11);
	Console_WriteStr((CHAR*)"   ", (LONGINT)4);
	GrTiles_DrawMonoTile(14, 4, DW2Rsrc_CornerLeftUp, 4);
	GrTiles_DrawMonoTile(30, 4, DW2Rsrc_CornerRightUp, 4);
	cor = 15;
	_for__3 = 29;
	_for__3 = (_for__3 - cor) + 1;
	do {
		GrTiles_DrawMonoTile(cor, 4, DW2Rsrc_HorizontalLine, 4);
		GrTiles_DrawMonoTile(cor, 8, DW2Rsrc_HorizontalLine, 4);
		cor += 1;
		_for__3 -= 1;
	} while (!(_for__3 == 0));
	cor = 5;
	_for__2 = 7;
	_for__2 = (_for__2 - cor) + 1;
	do {
		GrTiles_DrawMonoTile(14, cor, DW2Rsrc_VerticalLine, 4);
		GrTiles_DrawMonoTile(30, cor, DW2Rsrc_VerticalLine, 4);
		cor += 1;
		_for__2 -= 1;
	} while (!(_for__2 == 0));
	GrTiles_DrawMonoTile(14, 8, DW2Rsrc_CornerLeftDown, 4);
	GrTiles_DrawMonoTile(30, 8, DW2Rsrc_CornerRightDown, 4);
	Console_SetColors(4);
	Console_At(17, 5);
	Console_WriteStr((CHAR*)"D A R K", (LONGINT)8);
	Console_At(20, 7);
	Console_WriteStr((CHAR*)"W O O D S", (LONGINT)10);
	Console_SetColors(1);
	Console_At(11, 14);
	Console_WriteStr((CHAR*)"Jocke The Beast", (LONGINT)16);
	Console_At(9, 15);
	Console_WriteStr((CHAR*)"-----------------", (LONGINT)18);
	Console_At(13, 16);
	Console_WriteStr((CHAR*)"(C) 2002", (LONGINT)9);
	Console_At(1, 20);
	Console_SetColors(5);
	Console_WriteStr((CHAR*)"(P)", (LONGINT)4);
	Console_SetColors(3);
	Console_WriteStr((CHAR*)"lay  ", (LONGINT)6);
	Console_SetColors(5);
	Console_WriteStr((CHAR*)"(I)", (LONGINT)4);
	Console_SetColors(3);
	Console_WriteStr((CHAR*)"nstructions  ", (LONGINT)14);
	Console_SetColors(5);
	Console_WriteStr((CHAR*)"(Q)", (LONGINT)4);
	Console_SetColors(3);
	Console_WriteStr((CHAR*)"uit", (LONGINT)4);
}


export void *SemiAction__init(void)
{
	__DEFMOD;
	__IMPORT(DW2Config__init);
	__IMPORT(GrFonts__init);
	__IMPORT(DW2Rsrc__init);
	__IMPORT(Console__init);
	__IMPORT(GrTiles__init);
	__REGMOD("SemiAction", 0);
	__REGCMD("MainMenu", SemiAction_MainMenu);
/* BEGIN */
	__ENDMOD;
}
