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
	INTEGER cor, _for__3, _for__2;
	Console_Clear(Console_Black);
	Console_SetFont(GrFonts_ZxSpecRom8x8, 768);
	Console_SetColors(Console_GrayOnBlue);
	Console_WriteStr((CHAR*)" DarkWoods I & II Port ", (LONGINT)24);
	Console_SetColors(Console_BlueOnCyan);
	Console_WriteStr((CHAR*)" VEDAsoft \'2013  ", (LONGINT)18);
	Console_SetFont(GrFonts_MsDosCga8x8, 2048);
	Console_SetColors(Console_GreenOnGreen);
	Console_At(5, 2);
	Console_WriteStr((CHAR*)"       ", (LONGINT)8);
	Console_At(4, 3);
	Console_WriteStr((CHAR*)"  ", (LONGINT)3);
	Console_At(7, 3);
	Console_WriteStr((CHAR*)"   ", (LONGINT)4);
	Console_At(11, 3);
	Console_WriteStr((CHAR*)"  ", (LONGINT)3);
	Console_At(3, 4);
	Console_WriteStr((CHAR*)"           ", (LONGINT)12);
	Console_At(4, 5);
	Console_WriteStr((CHAR*)"         ", (LONGINT)10);
	Console_At(6, 6);
	Console_WriteStr((CHAR*)"  ", (LONGINT)3);
	Console_At(9, 6);
	Console_WriteStr((CHAR*)"  ", (LONGINT)3);
	Console_At(6, 7);
	Console_WriteStr((CHAR*)"     ", (LONGINT)6);
	Console_At(6, 10);
	Console_WriteStr((CHAR*)"     ", (LONGINT)6);
	Console_At(7, 11);
	Console_WriteStr((CHAR*)"   ", (LONGINT)4);
	(*GrTiles_DrawMonoTile)(16, 4, (void*)DW2Rsrc_CornerLeftUp, 8, Console_GreenOnBlack);
	(*GrTiles_DrawMonoTile)(35, 4, (void*)DW2Rsrc_CornerRightUp, 8, Console_GreenOnBlack);
	cor = 17;
	_for__3 = 34;
	_for__3 = (_for__3 - cor) + 1;
	do {
		(*GrTiles_DrawMonoTile)(cor, 4, (void*)DW2Rsrc_HorizontalLine, 8, Console_GreenOnBlack);
		(*GrTiles_DrawMonoTile)(cor, 8, (void*)DW2Rsrc_HorizontalLine, 8, Console_GreenOnBlack);
		cor += 1;
		_for__3 -= 1;
	} while (!(_for__3 == 0));
	cor = 5;
	_for__2 = 7;
	_for__2 = (_for__2 - cor) + 1;
	do {
		(*GrTiles_DrawMonoTile)(16, cor, (void*)DW2Rsrc_VerticalLine, 8, Console_GreenOnBlack);
		(*GrTiles_DrawMonoTile)(35, cor, (void*)DW2Rsrc_VerticalLine, 8, Console_GreenOnBlack);
		cor += 1;
		_for__2 -= 1;
	} while (!(_for__2 == 0));
	(*GrTiles_DrawMonoTile)(16, 8, (void*)DW2Rsrc_CornerLeftDown, 8, Console_GreenOnBlack);
	(*GrTiles_DrawMonoTile)(35, 8, (void*)DW2Rsrc_CornerRightDown, 8, Console_GreenOnBlack);
	Console_SetColors(Console_GreenOnBlack);
	Console_At(21, 5);
	Console_WriteStr((CHAR*)"D A R K", (LONGINT)8);
	Console_At(24, 7);
	Console_WriteStr((CHAR*)"W O O D S", (LONGINT)10);
	Console_SetColors(Console_BlueOnBlack);
	Console_At(14, 14);
	Console_WriteStr((CHAR*)"Jocke The Beast", (LONGINT)16);
	Console_At(12, 15);
	Console_WriteStr((CHAR*)"-----------------", (LONGINT)18);
	Console_At(16, 16);
	Console_WriteStr((CHAR*)"(C) 2002", (LONGINT)9);
	Console_At(2, 20);
	Console_SetColors(Console_CyanOnBlack);
	Console_WriteStr((CHAR*)"(P)", (LONGINT)4);
	Console_SetColors(Console_MagentaOnBlack);
	Console_WriteStr((CHAR*)"lay    ", (LONGINT)8);
	Console_SetColors(Console_CyanOnBlack);
	Console_WriteStr((CHAR*)"(I)", (LONGINT)4);
	Console_SetColors(Console_MagentaOnBlack);
	Console_WriteStr((CHAR*)"nstructions    ", (LONGINT)16);
	Console_SetColors(Console_CyanOnBlack);
	Console_WriteStr((CHAR*)"(Q)", (LONGINT)4);
	Console_SetColors(Console_MagentaOnBlack);
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
