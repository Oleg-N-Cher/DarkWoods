/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "GrColors.h"
#include "GrScr.h"
#include "SdlLib.h"


export GrColors_Colors DWColors_Eduin, DWColors_Tree, DWColors_Bush, DWColors_Wall, DWColors_Door, DWColors_Bow, DWColors_Arrows, DWColors_Potion, DWColors_Key, DWColors_Gold, DWColors_Jewel, DWColors_Firewall, DWColors_Trap, DWColors_Orc, DWColors_Troll, DWColors_RingOfFire, DWColors_Frame;





export void *DWColors__init(void)
{
	__DEFMOD;
	__IMPORT(GrColors__init);
	__IMPORT(GrScr__init);
	__IMPORT(SdlLib__init);
	__REGMOD("DWColors", 0);
/* BEGIN */
	DWColors_Eduin.paper = GrColors_Black;
	DWColors_Eduin.ink = SdlLib_MapRGB(GrScr_Screen->format, 0, 0, 0);
	__ENDMOD;
}
