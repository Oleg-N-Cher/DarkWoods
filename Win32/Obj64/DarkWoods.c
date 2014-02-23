/*  Ofront 1.2 -xtspkaem */
#include "SYSTEM.h"
#include "DWConfig.h"
#include "DWColors.h"
#include "GrFonts.h"
#include "GrCfg.h"
#include "GrScr.h"
#include "Input.h"
#include "DWRsrc.h"
#include "Console.h"
#include "GrTiles.h"
#include "Timer.h"




static void DarkWoods_BlinkEffect (INTEGER x, INTEGER y, CHAR *lines, LONGINT lines__len, LONGINT lines__len1);
static void DarkWoods_Draw (INTEGER x, INTEGER y, CHAR obj);
static void DarkWoods_PressAnyKey (void);
static BOOLEAN DarkWoods_QuitMenu (void);
static void DarkWoods_ShowIntro (void);
static void DarkWoods_ShowSplash (void);
static void DarkWoods_ShowTitleMenu (void);
export void DarkWoods_WriteCenter (CHAR *text, LONGINT text__len);


static void DarkWoods_ShowSplash (void)
{
}

static void DarkWoods_BlinkEffect (INTEGER x, INTEGER y, CHAR *lines, LONGINT lines__len, LONGINT lines__len1)
{
	INTEGER x1, y1, _for__4, _for__3, _for__2;
	_for__4 = (int)lines__len1 - 2;
	x1 = 0;
	while (x1 <= _for__4) {
		Console_SetColors(Console_LWhiteOnBlack);
		_for__3 = (int)lines__len - 1;
		y1 = 0;
		while (y1 <= _for__3) {
			Console_At(x + x1, y + y1);
			Console_WriteCh(lines[__X(x1, lines__len1) + lines__len1 * (__X(y1, lines__len))]);
			y1 += 1;
		}
		GrScr_Update();
		Timer_Delay(60);
		Console_SetColors(Console_BlueOnBlack);
		_for__2 = (int)lines__len - 1;
		y1 = 0;
		while (y1 <= _for__2) {
			Console_At(x + x1, y + y1);
			Console_WriteCh(lines[__X(x1, lines__len1) + lines__len1 * (__X(y1, lines__len))]);
			y1 += 1;
		}
		x1 += 1;
	}
	GrScr_Update();
}

static void DarkWoods_ShowTitleMenu (void)
{
	INTEGER cor;
	CHAR copyright[3][18];
	for (;;) {
		Console_Clear(Console_Black);
		Console_SetFont(DWRsrc_ZxSpecRom8x8, 768);
		Console_SetColors(Console_WhiteOnBlue);
		Console_WriteStr((CHAR*)" DarkWoods I & II Port ", (LONGINT)24);
		Console_SetColors(Console_BlueOnCyan);
		Console_WriteStr((CHAR*)" VEDAsoft \'2014  ", (LONGINT)18);
		Console_SetFont(DWRsrc_MsDosCga8x8, 2048);
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
		(*GrTiles_DrawMonoTile)(16, 4, (void*)DWRsrc_CornerLeftUp, 8, Console_GreenOnBlack);
		(*GrTiles_DrawMonoTile)(35, 4, (void*)DWRsrc_CornerRightUp, 8, Console_GreenOnBlack);
		cor = 17;
		while (cor <= 34) {
			(*GrTiles_DrawMonoTile)(cor, 4, (void*)DWRsrc_HorizontalLine, 8, Console_GreenOnBlack);
			(*GrTiles_DrawMonoTile)(cor, 8, (void*)DWRsrc_HorizontalLine, 8, Console_GreenOnBlack);
			cor += 1;
		}
		cor = 5;
		while (cor <= 7) {
			(*GrTiles_DrawMonoTile)(16, cor, (void*)DWRsrc_VerticalLine, 8, Console_GreenOnBlack);
			(*GrTiles_DrawMonoTile)(35, cor, (void*)DWRsrc_VerticalLine, 8, Console_GreenOnBlack);
			cor += 1;
		}
		(*GrTiles_DrawMonoTile)(16, 8, (void*)DWRsrc_CornerLeftDown, 8, Console_GreenOnBlack);
		(*GrTiles_DrawMonoTile)(35, 8, (void*)DWRsrc_CornerRightDown, 8, Console_GreenOnBlack);
		Console_SetColors(Console_GreenOnBlack);
		Console_At(21, 5);
		Console_WriteStr((CHAR*)"D A R K", (LONGINT)8);
		Console_At(24, 7);
		Console_WriteStr((CHAR*)"W O O D S", (LONGINT)10);
		__MOVE("  Jocke The Beast", copyright[0], 18);
		__MOVE("-----------------", copyright[1], 18);
		__MOVE("    (C) 2002     ", copyright[2], 18);
		Console_SetColors(Console_BlueOnBlack);
		Console_At(12, 14);
		Console_WriteStr(copyright[0], 18);
		Console_At(12, 15);
		Console_WriteStr(copyright[1], 18);
		Console_At(12, 16);
		Console_WriteStr(copyright[2], 18);
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
		GrScr_Update();
		DarkWoods_BlinkEffect(12, 14, (void*)copyright, 3, 18);
		for (;;) {
			Console_At(0, 3);
			Console_SetColors(Console_YellowOnBlack);
			switch (__CAP(Input_Read())) {
				case 'P': 
					return;
					break;
				case 'I': 
					DarkWoods_ShowIntro();
					goto exit__0;
					break;
				case 'Q': 
					if (DarkWoods_QuitMenu()) {
						return;
					}
					goto exit__0;
					break;
				default: 
					break;
			}
		}
		exit__0:;
	}
}

void DarkWoods_WriteCenter (CHAR *text, LONGINT text__len)
{
	INTEGER n;
	n = (int)__ASHR(40 - (int)text__len, 1);
	while (n > 0) {
		Console_WriteCh(' ');
		n -= 1;
	}
	Console_WriteStrLn(text, text__len);
}

static void DarkWoods_PressAnyKey (void)
{
	Console_WriteLn();
	Console_SetColors(Console_GrayOnBlack);
	Console_WriteStr((CHAR*)"           Press any key...", (LONGINT)28);
	GrScr_Update();
	if (Input_Read() == 0x00) {
	}
	Console_Clear(Console_Black);
	Console_SetColors(Console_WhiteOnBlack);
}

static void DarkWoods_Draw (INTEGER x, INTEGER y, CHAR obj)
{
	switch (obj) {
		case 0x00: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Eduin, 8, DWColors_Eduin);
			break;
		case 0x01: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Tree, 8, DWColors_Tree);
			break;
		case 0x02: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Bush, 8, DWColors_Bush);
			break;
		case 0x03: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Wall, 8, DWColors_Wall);
			break;
		case 0x04: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Door, 8, DWColors_Door);
			break;
		case 0x05: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Bow, 8, DWColors_Bow);
			break;
		case 0x06: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Arrows, 8, DWColors_Arrows);
			break;
		case 0x07: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Potion, 8, DWColors_Potion);
			break;
		case 0x08: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Key, 8, DWColors_Key);
			break;
		case 0x09: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Gold, 8, DWColors_Gold);
			break;
		case 0x0a: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Jewel, 8, DWColors_Jewel);
			break;
		case 0x0b: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Firewall, 8, DWColors_Firewall);
			break;
		case 0x0c: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Trap, 8, DWColors_Trap);
			break;
		case 0x0d: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Orc, 8, DWColors_Orc);
			break;
		case 0x0e: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_Troll, 8, DWColors_Troll);
			break;
		case 0x0f: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DWRsrc_RingOfFire, 8, DWColors_RingOfFire);
			break;
		default: 
			break;
	}
}

static void DarkWoods_ShowIntro (void)
{
	Console_Clear(Console_Black);
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStr((CHAR*)" :  I am ", (LONGINT)10);
	DarkWoods_Draw(0, 0, 0x00);
	Console_SetColors(Console_GreenOnBlack);
	Console_WriteStr((CHAR*)"Eduin", (LONGINT)6);
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)", the fearless", (LONGINT)15);
	Console_WriteStrLn((CHAR*)"    adventurer.", (LONGINT)16);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"    You can move me around using the", (LONGINT)37);
	Console_SetColors(Console_LGreenOnBlack);
	Console_WriteStrLn((CHAR*)"    arrow keys.", (LONGINT)16);
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"    Press the ", (LONGINT)15);
	Console_SetColors(Console_LGreenOnBlack);
	Console_WriteCh('.');
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)" key and I will stand", (LONGINT)22);
	Console_WriteStrLn((CHAR*)"    still for a turn, letting the", (LONGINT)34);
	Console_WriteStrLn((CHAR*)"    enemies move.", (LONGINT)18);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"    Press ", (LONGINT)11);
	Console_SetColors(Console_LGreenOnBlack);
	Console_WriteStr((CHAR*)"SPACE", (LONGINT)6);
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)", followed by an arrow", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"    key, and I will swing my trusty", (LONGINT)36);
	Console_WriteStrLn((CHAR*)"    sword, destroying any bushes", (LONGINT)33);
	Console_WriteStrLn((CHAR*)"    or Orcs in my way.", (LONGINT)23);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"    Press ", (LONGINT)11);
	Console_SetColors(Console_LGreenOnBlack);
	Console_WriteCh('S');
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)", followed by an arrow", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"    key, and I will shoot my Bow", (LONGINT)33);
	Console_WriteStrLn((CHAR*)"    (if, of course, I posess a Bow,)", (LONGINT)37);
	Console_WriteStrLn((CHAR*)"    which will kill any enemy.", (LONGINT)31);
	DarkWoods_PressAnyKey();
	Console_WriteLn();
	Console_WriteStr((CHAR*)"    Press ", (LONGINT)11);
	Console_SetColors(Console_LGreenOnBlack);
	Console_WriteCh('M');
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)", followed by an arrow", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"    key, and I will throw", (LONGINT)26);
	Console_WriteStrLn((CHAR*)"    a Firewall spell", (LONGINT)21);
	DarkWoods_Draw(20, 3, 0x0b);
	Console_WriteStrLn((CHAR*)"    This spell creates a", (LONGINT)25);
	Console_WriteStrLn((CHAR*)"    firewall (unwalkable).", (LONGINT)27);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"    Press ", (LONGINT)11);
	Console_SetColors(Console_LGreenOnBlack);
	Console_WriteCh('+');
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)" and Eduin will commit", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"    suicide.", (LONGINT)13);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"    Press ", (LONGINT)11);
	Console_SetColors(Console_LGreenOnBlack);
	Console_WriteCh('F');
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)" to turn Sound", (LONGINT)15);
	Console_WriteStrLn((CHAR*)"    on/off.", (LONGINT)12);
	DarkWoods_PressAnyKey();
	Console_WriteStrLn((CHAR*)" :  Trees (impassable)", (LONGINT)23);
	DarkWoods_Draw(0, 0, 0x01);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Bushes - these can be hacked away", (LONGINT)38);
	DarkWoods_Draw(0, 2, 0x02);
	Console_WriteStrLn((CHAR*)"    with one swipe of my Sword.", (LONGINT)32);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Walls or Ruins (impassable)", (LONGINT)32);
	DarkWoods_Draw(0, 5, 0x03);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Door. Opens when you have a key", (LONGINT)36);
	DarkWoods_Draw(0, 7, 0x04);
	Console_WriteStrLn((CHAR*)"    and walk into the door.", (LONGINT)28);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" , :Bow and Arrows. A Arrow", (LONGINT)28);
	DarkWoods_Draw(0, 10, 0x05);
	Console_WriteStrLn((CHAR*)"    mark contains 3 arrows each.", (LONGINT)33);
	DarkWoods_Draw(2, 10, 0x06);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Magic potion. Gives 2 magic points.", (LONGINT)40);
	DarkWoods_Draw(0, 13, 0x07);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Keys. Open doors.", (LONGINT)22);
	DarkWoods_Draw(0, 15, 0x08);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" , :Gold and Jewels - bonus points", (LONGINT)35);
	DarkWoods_Draw(0, 17, 0x09);
	DarkWoods_Draw(2, 17, 0x0a);
	DarkWoods_PressAnyKey();
	Console_WriteStrLn((CHAR*)" :  Traps. If you are", (LONGINT)22);
	DarkWoods_Draw(0, 0, 0x0c);
	Console_WriteStrLn((CHAR*)"    foolish enough to walk into a trap,", (LONGINT)40);
	Console_WriteStrLn((CHAR*)"    you\'ll die a horrible death.", (LONGINT)33);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Orcs.  These can be", (LONGINT)24);
	DarkWoods_Draw(0, 4, 0x0d);
	Console_WriteStrLn((CHAR*)"    killed with either a sword,bowshot", (LONGINT)39);
	Console_WriteStrLn((CHAR*)"    or a Firewall spell.", (LONGINT)25);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Trolls. They can be killed", (LONGINT)31);
	DarkWoods_Draw(0, 8, 0x0e);
	Console_WriteStrLn((CHAR*)"    only by a bowshot.", (LONGINT)23);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  The Ring Of Fire  -- The", (LONGINT)29);
	DarkWoods_Draw(0, 11, 0x0f);
	Console_WriteStrLn((CHAR*)"    object of your quest...", (LONGINT)28);
	DarkWoods_PressAnyKey();
	Console_SetColors(Console_BlueOnBlack);
	DarkWoods_WriteCenter((void*)&"HINTS:", (LONGINT)7);
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"To complete a Level you\'ll have to", (LONGINT)35);
	Console_WriteStrLn((CHAR*)"follow the Objectives of the current", (LONGINT)37);
	Console_WriteStrLn((CHAR*)"Level.", (LONGINT)7);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"If you die and decide to Continue from", (LONGINT)39);
	Console_WriteStrLn((CHAR*)"the last Level,you\'ll lose 100 points.", (LONGINT)39);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"You only have one life -- make it count.", (LONGINT)41);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"Don\'t waste arrows on Orcs --", (LONGINT)30);
	Console_WriteStrLn((CHAR*)"they are easily dispatched with your", (LONGINT)37);
	Console_WriteStrLn((CHAR*)"sword.", (LONGINT)7);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"Firewall spell makes a unwalkable wall.", (LONGINT)40);
	Console_WriteStrLn((CHAR*)"But remember that you can\'t remove it.", (LONGINT)39);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"Keys opens doors.Just walk on door.", (LONGINT)36);
	DarkWoods_PressAnyKey();
}

static BOOLEAN DarkWoods_QuitMenu (void)
{
	INTEGER cor;
	CHAR thanx[2][28];
	Console_SetColors(Console_MagentaOnBlack);
	Console_At(5, 8);
	Console_WriteStr((CHAR*)"Do you really want to Quit \?", (LONGINT)29);
	Console_At(5, 9);
	Console_WriteStr((CHAR*)"            Y / N           ", (LONGINT)29);
	Console_At(5, 10);
	Console_WriteStr((CHAR*)"                            ", (LONGINT)29);
	(*GrTiles_DrawMonoTile)(2, 7, (void*)DWRsrc_CornerLeftUp2, 8, Console_MagentaOnBlack);
	(*GrTiles_DrawMonoTile)(33, 7, (void*)DWRsrc_CornerRightUp2, 8, Console_MagentaOnBlack);
	cor = 3;
	while (cor <= 32) {
		(*GrTiles_DrawTranspMonoTile)(cor, 7, (void*)DWRsrc_HorizontalLine2, 16, Console_MagentaOnBlack);
		(*GrTiles_DrawTranspMonoTile)(cor, 11, (void*)DWRsrc_HorizontalLine3, 16, Console_MagentaOnBlack);
		cor += 1;
	}
	cor = 8;
	while (cor <= 10) {
		(*GrTiles_DrawMonoTile)(2, cor, (void*)DWRsrc_VerticalLine2, 8, Console_MagentaOnBlack);
		(*GrTiles_DrawTranspMonoTile)(33, cor, (void*)DWRsrc_VerticalLine3, 16, Console_MagentaOnBlack);
		cor += 1;
	}
	(*GrTiles_DrawMonoTile)(2, 11, (void*)DWRsrc_CornerLeftDown2, 8, Console_MagentaOnBlack);
	(*GrTiles_DrawMonoTile)(33, 11, (void*)DWRsrc_CornerRightDown2, 8, Console_MagentaOnBlack);
	GrScr_Update();
	for (;;) {
		switch (__CAP(Input_Read())) {
			case 'Y': 
				goto exit__1;
				break;
			case 'N': 
				return 0;
				break;
			default: 
				break;
		}
	}
	exit__1:;
	__MOVE("Thanx for playing DARK WOOD", thanx[0], 28);
	__MOVE("by Jocke The Beast.        ", thanx[1], 28);
	Console_Clear(Console_Black);
	Console_SetColors(Console_BlueOnBlack);
	Console_At(3, 2);
	Console_WriteStr(thanx[0], 28);
	Console_WriteCh('S');
	Console_At(3, 3);
	Console_WriteStr(thanx[1], 28);
	DarkWoods_BlinkEffect(3, 2, (void*)thanx, 2, 28);
	Console_At(0, 6);
	Console_WriteStrLn((CHAR*)" Credits:", (LONGINT)10);
	Console_SetColors(Console_GreenOnBlack);
	Console_WriteStrLn((CHAR*)" Game made by:    Jocke The Beast", (LONGINT)34);
	Console_WriteStrLn((CHAR*)" Graphic:         Microsoft ASCII", (LONGINT)34);
	Console_WriteStrLn((CHAR*)" Idea by:         Zack Johnson", (LONGINT)31);
	Console_WriteStrLn((CHAR*)" Beta-tester:     Jonge", (LONGINT)24);
	Console_WriteLn();
	Console_WriteLn();
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)" This game is a tribute to Zack Johnson.", (LONGINT)41);
	Console_WriteStrLn((CHAR*)" He made a game called Jungle Raul 1996.", (LONGINT)41);
	Console_WriteStrLn((CHAR*)" A game that I thought was very funny", (LONGINT)38);
	Console_WriteStrLn((CHAR*)" to play, and still do.", (LONGINT)24);
	Console_WriteLn();
	Console_SetColors(Console_MagentaOnBlack);
	Console_WriteStrLn((CHAR*)" http://geocities.ws/jockeqbasic", (LONGINT)33);
	DarkWoods_PressAnyKey();
	return 1;
}


export main(int argc, char **argv)
{
	__INIT(argc, argv);
	__IMPORT(DWConfig__init);
	__IMPORT(DWColors__init);
	__IMPORT(GrFonts__init);
	__IMPORT(GrCfg__init);
	__IMPORT(GrScr__init);
	__IMPORT(Input__init);
	__IMPORT(DWRsrc__init);
	__IMPORT(Console__init);
	__IMPORT(GrTiles__init);
	__IMPORT(Timer__init);
	__REGMAIN("DarkWoods", 0);
/* BEGIN */
	do {
		DarkWoods_ShowSplash();
		DarkWoods_ShowTitleMenu();
		GrScr_Close();
	} while (!1);
	__FINI;
}
