/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "DW2Config.h"
#include "DW2Colors.h"
#include "GrFonts.h"
#include "GrScr.h"
#include "Input.h"
#include "DW2Rsrc.h"
#include "Console.h"
#include "GrTiles.h"




static void SemiAction_Draw (INTEGER x, INTEGER y, CHAR obj);
export void SemiAction_MainMenu (void);
static void SemiAction_PressAnyKey (void);
static BOOLEAN SemiAction_QuitMenu (void);
static void SemiAction_ShowIntro (void);


static void SemiAction_Draw (INTEGER x, INTEGER y, CHAR obj)
{
	switch (obj) {
		case 0x00: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Face, 8, DW2Colors_Face);
			break;
		case 0x01: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Tree, 8, DW2Colors_Tree);
			break;
		case 0x02: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Bush, 8, DW2Colors_Bush);
			break;
		case 0x03: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Wall, 8, DW2Colors_Wall);
			break;
		case 0x04: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Door, 8, DW2Colors_Door);
			break;
		case 0x05: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Bow, 8, DW2Colors_Bow);
			break;
		case 0x06: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Arrow, 8, DW2Colors_Arrow);
			break;
		case 0x07: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Potion, 8, DW2Colors_Potion);
			break;
		case 0x08: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Key, 8, DW2Colors_Key);
			break;
		case 0x09: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Gold, 8, DW2Colors_Gold);
			break;
		case 0x0a: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Jewel, 8, DW2Colors_Jewel);
			break;
		case 0x0b: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Firewall, 8, DW2Colors_Firewall);
			break;
		case 0x0c: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Trap, 8, DW2Colors_Trap);
			break;
		case 0x0d: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Orc, 8, DW2Colors_Orc);
			break;
		case 0x0e: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_Troll, 8, DW2Colors_Troll);
			break;
		case 0x0f: 
			(*GrTiles_DrawMonoTile)(x, y, (void*)DW2Rsrc_RingOfFire, 8, DW2Colors_RingOfFire);
			break;
		default: 
			break;
	}
}

void SemiAction_MainMenu (void)
{
	INTEGER cor, _for__4, _for__3;
	for (;;) {
		Console_Clear(Console_Black);
		Console_SetFont(GrFonts_ZxSpecRom8x8, 768);
		Console_SetColors(Console_WhiteOnBlue);
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
		_for__4 = 34;
		_for__4 = (_for__4 - cor) + 1;
		do {
			(*GrTiles_DrawMonoTile)(cor, 4, (void*)DW2Rsrc_HorizontalLine, 8, Console_GreenOnBlack);
			(*GrTiles_DrawMonoTile)(cor, 8, (void*)DW2Rsrc_HorizontalLine, 8, Console_GreenOnBlack);
			cor += 1;
			_for__4 -= 1;
		} while (!(_for__4 == 0));
		cor = 5;
		_for__3 = 7;
		_for__3 = (_for__3 - cor) + 1;
		do {
			(*GrTiles_DrawMonoTile)(16, cor, (void*)DW2Rsrc_VerticalLine, 8, Console_GreenOnBlack);
			(*GrTiles_DrawMonoTile)(35, cor, (void*)DW2Rsrc_VerticalLine, 8, Console_GreenOnBlack);
			cor += 1;
			_for__3 -= 1;
		} while (!(_for__3 == 0));
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
		GrScr_Update();
		for (;;) {
			switch (__CAP(Input_Read())) {
				case 'P': 
					goto exit__0;
					break;
				case 'I': 
					SemiAction_ShowIntro();
					goto exit__0;
					break;
				case 'Q': 
					if (SemiAction_QuitMenu()) {
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

static void SemiAction_PressAnyKey (void)
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

static void SemiAction_ShowIntro (void)
{
	Console_Clear(Console_Black);
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStr((CHAR*)" :  I am ", (LONGINT)10);
	SemiAction_Draw(0, 0, 0x00);
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
	SemiAction_PressAnyKey();
	Console_WriteLn();
	Console_WriteStr((CHAR*)"    Press ", (LONGINT)11);
	Console_SetColors(Console_LGreenOnBlack);
	Console_WriteCh('M');
	Console_SetColors(Console_WhiteOnBlack);
	Console_WriteStrLn((CHAR*)", followed by an arrow", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"    key, and I will throw", (LONGINT)26);
	Console_WriteStrLn((CHAR*)"    a Firewall spell", (LONGINT)21);
	SemiAction_Draw(20, 3, 0x0b);
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
	SemiAction_PressAnyKey();
	Console_WriteStrLn((CHAR*)" :  Trees (impassable)", (LONGINT)23);
	SemiAction_Draw(0, 0, 0x01);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Bushes - these can be hacked away", (LONGINT)38);
	SemiAction_Draw(0, 2, 0x02);
	Console_WriteStrLn((CHAR*)"    with one swipe of my Sword.", (LONGINT)32);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Walls or Ruins (impassable)", (LONGINT)32);
	SemiAction_Draw(0, 5, 0x03);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Door. Opens when you have a key", (LONGINT)36);
	SemiAction_Draw(0, 7, 0x04);
	Console_WriteStrLn((CHAR*)"    and walk into the door.", (LONGINT)28);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" , :Bow and Arrows. A Arrow", (LONGINT)28);
	SemiAction_Draw(0, 10, 0x05);
	Console_WriteStrLn((CHAR*)"    mark contains 3 arrows each.", (LONGINT)33);
	SemiAction_Draw(2, 10, 0x06);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Magic potion. Gives 2 magic points.", (LONGINT)40);
	SemiAction_Draw(0, 13, 0x07);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Keys. Open doors.", (LONGINT)22);
	SemiAction_Draw(0, 15, 0x08);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" , :Gold and Jewels - bonus points", (LONGINT)35);
	SemiAction_Draw(0, 17, 0x09);
	SemiAction_Draw(2, 17, 0x0a);
	SemiAction_PressAnyKey();
	Console_WriteStrLn((CHAR*)" :  Traps. If you are", (LONGINT)22);
	SemiAction_Draw(0, 0, 0x0c);
	Console_WriteStrLn((CHAR*)"    foolish enough to walk into a trap,", (LONGINT)40);
	Console_WriteStrLn((CHAR*)"    you\'ll die a horrible death.", (LONGINT)33);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Orcs.  These can be", (LONGINT)24);
	SemiAction_Draw(0, 4, 0x0d);
	Console_WriteStrLn((CHAR*)"    killed with either a sword,bowshot", (LONGINT)39);
	Console_WriteStrLn((CHAR*)"    or a Firewall spell.", (LONGINT)25);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Trolls. They can be killed", (LONGINT)31);
	SemiAction_Draw(0, 8, 0x0e);
	Console_WriteStrLn((CHAR*)"    only by a bowshot.", (LONGINT)23);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  The Ring Of Fire  -- The", (LONGINT)29);
	SemiAction_Draw(0, 11, 0x0f);
	Console_WriteStrLn((CHAR*)"    object of your quest...", (LONGINT)28);
	SemiAction_PressAnyKey();
	Console_SetColors(Console_BlueOnBlack);
	Console_At(16, 0);
	Console_WriteStrLn((CHAR*)"HINTS:", (LONGINT)7);
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
	SemiAction_PressAnyKey();
}

static BOOLEAN SemiAction_QuitMenu (void)
{
	INTEGER cor, _for__8, _for__7;
	Console_SetColors(Console_MagentaOnBlack);
	Console_At(5, 8);
	Console_WriteStr((CHAR*)"Do you really want to Quit \?", (LONGINT)29);
	Console_At(5, 9);
	Console_WriteStr((CHAR*)"            Y / N           ", (LONGINT)29);
	Console_At(5, 10);
	Console_WriteStr((CHAR*)"                            ", (LONGINT)29);
	(*GrTiles_DrawMonoTile)(2, 7, (void*)DW2Rsrc_CornerLeftUp2, 8, Console_MagentaOnBlack);
	(*GrTiles_DrawMonoTile)(33, 7, (void*)DW2Rsrc_CornerRightUp2, 8, Console_MagentaOnBlack);
	cor = 3;
	_for__8 = 32;
	_for__8 = (_for__8 - cor) + 1;
	do {
		(*GrTiles_DrawTranspMonoTile)(cor, 7, (void*)DW2Rsrc_HorizontalLine2, 16, Console_MagentaOnBlack);
		(*GrTiles_DrawTranspMonoTile)(cor, 11, (void*)DW2Rsrc_HorizontalLine3, 16, Console_MagentaOnBlack);
		cor += 1;
		_for__8 -= 1;
	} while (!(_for__8 == 0));
	cor = 8;
	_for__7 = 10;
	_for__7 = (_for__7 - cor) + 1;
	do {
		(*GrTiles_DrawMonoTile)(2, cor, (void*)DW2Rsrc_VerticalLine2, 8, Console_MagentaOnBlack);
		(*GrTiles_DrawMonoTile)(33, cor, (void*)DW2Rsrc_VerticalLine3, 8, Console_MagentaOnBlack);
		cor += 1;
		_for__7 -= 1;
	} while (!(_for__7 == 0));
	(*GrTiles_DrawMonoTile)(2, 11, (void*)DW2Rsrc_CornerLeftDown2, 8, Console_MagentaOnBlack);
	(*GrTiles_DrawMonoTile)(33, 11, (void*)DW2Rsrc_CornerRightDown2, 8, Console_MagentaOnBlack);
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
	Console_Clear(Console_Black);
	Console_SetColors(Console_BlueOnBlack);
	Console_WriteLn();
	Console_WriteLn();
	Console_WriteLn();
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"    Thanx for playing DARK WOODS", (LONGINT)33);
	Console_WriteStrLn((CHAR*)"    by Jocke The Beast.", (LONGINT)24);
	Console_WriteLn();
	Console_WriteLn();
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
	Console_WriteStrLn((CHAR*)" http://geocities.com/jockeqbasic", (LONGINT)34);
	SemiAction_PressAnyKey();
	return 1;
}


export void *SemiAction__init(void)
{
	__DEFMOD;
	__IMPORT(DW2Config__init);
	__IMPORT(DW2Colors__init);
	__IMPORT(GrFonts__init);
	__IMPORT(GrScr__init);
	__IMPORT(Input__init);
	__IMPORT(DW2Rsrc__init);
	__IMPORT(Console__init);
	__IMPORT(GrTiles__init);
	__REGMOD("SemiAction", 0);
	__REGCMD("MainMenu", SemiAction_MainMenu);
/* BEGIN */
	__ENDMOD;
}
