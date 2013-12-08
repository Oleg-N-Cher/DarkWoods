/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "GrColors.h"
#include "GrScr.h"
#include "SdlLib.h"


export GrColors_Colors DW2Colors_Face, DW2Colors_Tree, DW2Colors_Bush, DW2Colors_Wall, DW2Colors_Door, DW2Colors_Bow, DW2Colors_Arrow, DW2Colors_Potion, DW2Colors_Key, DW2Colors_Gold, DW2Colors_Jewel, DW2Colors_Firewall, DW2Colors_Trap, DW2Colors_Orc, DW2Colors_Troll, DW2Colors_RingOfFire;





export void *DW2Colors__init(void)
{
	__DEFMOD;
	__IMPORT(GrColors__init);
	__IMPORT(GrScr__init);
	__IMPORT(SdlLib__init);
	__REGMOD("DW2Colors", 0);
/* BEGIN */
	DW2Colors_Face.paper = GrColors_Black;
	DW2Colors_Face.ink = SdlLib_MapRGB(GrScr_Screen->format, 0, 0, 0);
	__ENDMOD;
}
