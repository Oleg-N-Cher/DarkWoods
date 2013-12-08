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




static void SemiAction_Draw (SHORTINT x, SHORTINT y, CHAR obj);
export void SemiAction_MainMenu (void);
static void SemiAction_PressAnyKey (void);
static BOOLEAN SemiAction_QuitMenu (void);
static void SemiAction_ShowIntro (void);


static void SemiAction_Draw (SHORTINT x, SHORTINT y, CHAR obj)
{
	switch (obj) {
		case 0x00: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Face, 70);
			break;
		case 0x01: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Tree, 4);
			break;
		case 0x02: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Bush, 68);
			break;
		case 0x03: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Wall, 7);
			break;
		case 0x04: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Door, 7);
			break;
		case 0x05: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Bow, 71);
			break;
		case 0x06: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Arrow, 71);
			break;
		case 0x07: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Potion, 66);
			break;
		case 0x08: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Key, 70);
			break;
		case 0x09: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Gold, 70);
			break;
		case 0x0a: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Jewel, 70);
			break;
		case 0x0b: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Firewall, 66);
			break;
		case 0x0c: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Trap, 2);
			break;
		case 0x0d: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Orc, 2);
			break;
		case 0x0e: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_Troll, 2);
			break;
		case 0x0f: 
			GrTiles_DrawMonoTile(x, y, DW2Rsrc_RingOfFire, 1);
			break;
		default: 
			break;
	}
}

void SemiAction_MainMenu (void)
{
	SHORTINT cor, _for__4, _for__3;
	for (;;) {
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
		_for__4 = 29;
		_for__4 = (_for__4 - cor) + 1;
		do {
			GrTiles_DrawMonoTile(cor, 4, DW2Rsrc_HorizontalLine, 4);
			GrTiles_DrawMonoTile(cor, 8, DW2Rsrc_HorizontalLine, 4);
			cor += 1;
			_for__4 -= 1;
		} while (!(_for__4 == 0));
		cor = 5;
		_for__3 = 7;
		_for__3 = (_for__3 - cor) + 1;
		do {
			GrTiles_DrawMonoTile(14, cor, DW2Rsrc_VerticalLine, 4);
			GrTiles_DrawMonoTile(30, cor, DW2Rsrc_VerticalLine, 4);
			cor += 1;
			_for__3 -= 1;
		} while (!(_for__3 == 0));
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
	Console_SetColors(6);
	Console_WriteStr((CHAR*)"        Press any key...", (LONGINT)25);
	GrScr_Update();
	if (Input_Read() == 0x00) {
	}
	Console_Clear(0);
	Console_SetColors(7);
}

static void SemiAction_ShowIntro (void)
{
	Console_Clear(0);
	Console_SetColors(7);
	Console_WriteStr((CHAR*)" : I am ", (LONGINT)9);
	SemiAction_Draw(0, 0, 0x00);
	Console_SetColors(4);
	Console_WriteStr((CHAR*)"Eduin", (LONGINT)6);
	Console_SetColors(7);
	Console_WriteStrLn((CHAR*)", the fearless", (LONGINT)15);
	Console_WriteStrLn((CHAR*)"   adventurer.", (LONGINT)15);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"   You can move me around", (LONGINT)26);
	Console_WriteStr((CHAR*)"   using the ", (LONGINT)14);
	Console_SetColors(68);
	Console_WriteStrLn((CHAR*)"arrow keys.", (LONGINT)12);
	Console_SetColors(7);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"   Press the ", (LONGINT)14);
	Console_SetColors(68);
	Console_WriteCh('.');
	Console_SetColors(7);
	Console_WriteStrLn((CHAR*)" key and I will", (LONGINT)16);
	Console_WriteStrLn((CHAR*)"   stand still for a turn,", (LONGINT)27);
	Console_WriteStrLn((CHAR*)"   letting the enemies move.", (LONGINT)29);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"   Press ", (LONGINT)10);
	Console_SetColors(68);
	Console_WriteStr((CHAR*)"SPACE", (LONGINT)6);
	Console_SetColors(7);
	Console_WriteStrLn((CHAR*)", followed by an", (LONGINT)17);
	Console_WriteStrLn((CHAR*)"   arrow key, and I will swing", (LONGINT)31);
	Console_WriteStrLn((CHAR*)"   my trusty sword, destroying", (LONGINT)31);
	Console_WriteStrLn((CHAR*)"   any bushes or Orcs in my way.", (LONGINT)33);
	Console_WriteStr((CHAR*)"   Press ", (LONGINT)10);
	Console_SetColors(68);
	Console_WriteCh('S');
	Console_SetColors(7);
	Console_WriteStrLn((CHAR*)", followed by an", (LONGINT)17);
	Console_WriteStrLn((CHAR*)"   arrow key, and I will shoot", (LONGINT)31);
	Console_WriteStrLn((CHAR*)"   my Bow (if, of course,", (LONGINT)26);
	Console_WriteStrLn((CHAR*)"   I posess a Bow,)", (LONGINT)20);
	Console_WriteStrLn((CHAR*)"   which will kill any enemy.", (LONGINT)30);
	SemiAction_PressAnyKey();
	Console_WriteLn();
	Console_WriteStr((CHAR*)"  Press ", (LONGINT)9);
	Console_SetColors(68);
	Console_WriteCh('M');
	Console_SetColors(7);
	Console_WriteStrLn((CHAR*)", followed by an arrow", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"  key, and I will throw", (LONGINT)24);
	Console_WriteStrLn((CHAR*)"  a Firewall spell", (LONGINT)19);
	SemiAction_Draw(18, 3, 0x0b);
	Console_WriteStrLn((CHAR*)"  This spell creates a", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"  firewall (unwalkable).", (LONGINT)25);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"  Press ", (LONGINT)9);
	Console_SetColors(68);
	Console_WriteCh('+');
	Console_SetColors(7);
	Console_WriteStrLn((CHAR*)" and Eduin will commit", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"  suicide.", (LONGINT)11);
	Console_WriteLn();
	Console_WriteStr((CHAR*)"  Press ", (LONGINT)9);
	Console_SetColors(68);
	Console_WriteCh('F');
	Console_SetColors(7);
	Console_WriteStrLn((CHAR*)" to turn Sound", (LONGINT)15);
	Console_WriteStrLn((CHAR*)"  on/off.", (LONGINT)10);
	SemiAction_PressAnyKey();
	Console_WriteStrLn((CHAR*)" :  Trees (impassable)", (LONGINT)23);
	SemiAction_Draw(0, 0, 0x01);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Bushes - these can be", (LONGINT)26);
	SemiAction_Draw(0, 2, 0x02);
	Console_WriteStrLn((CHAR*)"    hacked away with one swipe", (LONGINT)31);
	Console_WriteStrLn((CHAR*)"    of my Sword.", (LONGINT)17);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Walls or Ruins (impassable)", (LONGINT)32);
	SemiAction_Draw(0, 6, 0x03);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Door. Opens when you have a", (LONGINT)32);
	SemiAction_Draw(0, 8, 0x04);
	Console_WriteStrLn((CHAR*)"    key and walk into the door.", (LONGINT)32);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" , :Bow and Arrows. A Arrow", (LONGINT)28);
	SemiAction_Draw(0, 11, 0x05);
	Console_WriteStrLn((CHAR*)"    mark contains 3 arrows each.", (LONGINT)33);
	SemiAction_Draw(2, 11, 0x06);
	Console_WriteStrLn((CHAR*)" :  Magic potion. Gives 2 magic", (LONGINT)32);
	Console_WriteStrLn((CHAR*)"    points.", (LONGINT)12);
	SemiAction_Draw(0, 14, 0x07);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Keys. Open doors.", (LONGINT)22);
	SemiAction_Draw(0, 17, 0x08);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" , :Gold and Jewels - bonus", (LONGINT)28);
	Console_WriteStrLn((CHAR*)"    points", (LONGINT)11);
	SemiAction_Draw(0, 19, 0x09);
	SemiAction_Draw(2, 19, 0x0a);
	SemiAction_PressAnyKey();
	Console_WriteStrLn((CHAR*)" :  Traps. If you are", (LONGINT)22);
	SemiAction_Draw(0, 0, 0x0c);
	Console_WriteStrLn((CHAR*)"    foolish enough to walk", (LONGINT)27);
	Console_WriteStrLn((CHAR*)"    into a trap, you\'ll die", (LONGINT)28);
	Console_WriteStrLn((CHAR*)"    a horrible death.", (LONGINT)22);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  Orcs.  These can be", (LONGINT)24);
	SemiAction_Draw(0, 5, 0x0d);
	Console_WriteStrLn((CHAR*)"    killed with either a sword,", (LONGINT)32);
	Console_WriteStrLn((CHAR*)"    bowshot or a Firewall spell.", (LONGINT)33);
	Console_WriteStrLn((CHAR*)" :  Trolls. They can be killed", (LONGINT)31);
	SemiAction_Draw(0, 9, 0x0e);
	Console_WriteStrLn((CHAR*)"    only by a bowshot.", (LONGINT)23);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" :  The Ring Of Fire  -- The", (LONGINT)29);
	SemiAction_Draw(0, 12, 0x0f);
	Console_WriteStrLn((CHAR*)"    object of your quest...", (LONGINT)28);
	SemiAction_PressAnyKey();
	Console_SetColors(1);
	Console_At(12, 0);
	Console_WriteStrLn((CHAR*)"HINTS:", (LONGINT)7);
	Console_SetColors(7);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"To complete a Level you\'ll have", (LONGINT)32);
	Console_WriteStrLn((CHAR*)"to follow the Objectives of the", (LONGINT)32);
	Console_WriteStrLn((CHAR*)"current Level.", (LONGINT)15);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"If you die and decide to", (LONGINT)25);
	Console_WriteStrLn((CHAR*)"Continue from the last Level,", (LONGINT)30);
	Console_WriteStrLn((CHAR*)"you\'ll lose 100 points.", (LONGINT)24);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"You only have one life --", (LONGINT)26);
	Console_WriteStrLn((CHAR*)"make it count.", (LONGINT)15);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"Don\'t waste arrows on Orcs --", (LONGINT)30);
	Console_WriteStrLn((CHAR*)"they are easily dispatched with", (LONGINT)32);
	Console_WriteStrLn((CHAR*)"your sword.", (LONGINT)12);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"Firewall spell makes a", (LONGINT)23);
	Console_WriteStrLn((CHAR*)"unwalkable wall. But remember", (LONGINT)30);
	Console_WriteStrLn((CHAR*)"that you can\'t remove it.", (LONGINT)26);
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"Keys opens doors.Just walk on", (LONGINT)30);
	Console_WriteStr((CHAR*)"door.", (LONGINT)6);
	SemiAction_PressAnyKey();
}

static BOOLEAN SemiAction_QuitMenu (void)
{
	SHORTINT cor, _for__8, _for__7;
	Console_SetColors(3);
	Console_At(1, 8);
	Console_WriteStr((CHAR*)"Do you really want to Quit \?", (LONGINT)29);
	Console_At(1, 9);
	Console_WriteStr((CHAR*)"            Y / N           ", (LONGINT)29);
	GrTiles_DrawMonoTile(0, 7, DW2Rsrc_CornerLeftUp2, 3);
	GrTiles_DrawMonoTile(29, 7, DW2Rsrc_CornerRightUp2, 3);
	cor = 1;
	_for__8 = 28;
	_for__8 = (_for__8 - cor) + 1;
	do {
		GrTiles_DrawTranspMonoTile(cor, 7, DW2Rsrc_HorizontalLine2, 3);
		GrTiles_DrawTranspMonoTile(cor, 10, DW2Rsrc_HorizontalLine3, 3);
		cor += 1;
		_for__8 -= 1;
	} while (!(_for__8 == 0));
	cor = 8;
	_for__7 = 9;
	_for__7 = (_for__7 - cor) + 1;
	do {
		GrTiles_DrawMonoTile(0, cor, DW2Rsrc_VerticalLine2, 3);
		GrTiles_DrawMonoTile(29, cor, DW2Rsrc_VerticalLine3, 3);
		cor += 1;
		_for__7 -= 1;
	} while (!(_for__7 == 0));
	GrTiles_DrawMonoTile(0, 10, DW2Rsrc_CornerLeftDown2, 3);
	GrTiles_DrawMonoTile(29, 10, DW2Rsrc_CornerRightDown2, 3);
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
	Console_Clear(0);
	Console_SetColors(1);
	Console_WriteLn();
	Console_WriteLn();
	Console_WriteLn();
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)"  Thanx for playing DARK WOODS", (LONGINT)31);
	Console_WriteStrLn((CHAR*)"  by Jocke The Beast.", (LONGINT)22);
	Console_WriteLn();
	Console_WriteLn();
	Console_WriteStrLn((CHAR*)" Credits:", (LONGINT)10);
	Console_SetColors(4);
	Console_WriteStrLn((CHAR*)" Game made by:  Jocke The Beast", (LONGINT)32);
	Console_WriteStrLn((CHAR*)" Graphic:       Microsoft ASCII", (LONGINT)32);
	Console_WriteStrLn((CHAR*)" Idea by:       Zack Johnson", (LONGINT)29);
	Console_WriteStrLn((CHAR*)" Beta-tester:   Jonge", (LONGINT)22);
	Console_WriteLn();
	Console_WriteLn();
	Console_SetColors(7);
	Console_WriteStrLn((CHAR*)" This game is a tribute to Zack", (LONGINT)32);
	Console_WriteStrLn((CHAR*)" Johnson. He made a game called", (LONGINT)32);
	Console_WriteStrLn((CHAR*)" Jungle Raul 1996.", (LONGINT)19);
	Console_WriteStrLn((CHAR*)" A game that I thought was very", (LONGINT)32);
	Console_WriteStrLn((CHAR*)" funny to play, and still do.", (LONGINT)30);
	Console_WriteLn();
	Console_SetColors(3);
	Console_WriteStr((CHAR*)"http://geocities.com/jockeqbasic", (LONGINT)33);
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
