/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "GrFonts.h"


export SYSTEM_BYTE DWRsrc_MsDosCga8x8[2048];
export SYSTEM_BYTE DWRsrc_ZxSpecRom8x8[768];
export SYSTEM_BYTE DWRsrc_CornerLeftUp[8], DWRsrc_CornerRightUp[8], DWRsrc_CornerLeftDown[8], DWRsrc_CornerRightDown[8], DWRsrc_HorizontalLine[8], DWRsrc_VerticalLine[8], DWRsrc_CornerLeftUp2[8], DWRsrc_CornerRightUp2[8], DWRsrc_CornerLeftDown2[8], DWRsrc_CornerRightDown2[8], DWRsrc_VerticalLine2[8], DWRsrc_Eduin[8], DWRsrc_Tree[8], DWRsrc_Bush[8], DWRsrc_Wall[8], DWRsrc_Door[8], DWRsrc_Bow[8], DWRsrc_Arrows[8], DWRsrc_Potion[8], DWRsrc_Key[8], DWRsrc_Gold[8], DWRsrc_Jewel[8], DWRsrc_Firewall[8], DWRsrc_Trap[8], DWRsrc_Orc[8], DWRsrc_Troll[8], DWRsrc_RingOfFire[8];
export SYSTEM_BYTE DWRsrc_VerticalLine3[16], DWRsrc_HorizontalLine2[16], DWRsrc_HorizontalLine3[16];





export void *DWRsrc__init(void)
{
	__DEFMOD;
	__IMPORT(GrFonts__init);
	__REGMOD("DWRsrc", 0);
/* BEGIN */
	__ENDMOD;
}
