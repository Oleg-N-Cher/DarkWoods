/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "Basic.h"
#include "GrFonts.h"
#include "Platform.h"


export INTEGER DWRsrc_MsDosCga8x8, DWRsrc_CornerLeftUp, DWRsrc_CornerRightUp, DWRsrc_CornerLeftDown, DWRsrc_CornerRightDown, DWRsrc_VerticalLine, DWRsrc_HorizontalLine, DWRsrc_CornerLeftUp2, DWRsrc_HorizontalLine2, DWRsrc_HorizontalLine3, DWRsrc_CornerRightDown2, DWRsrc_CornerRightUp2, DWRsrc_CornerLeftDown2, DWRsrc_VerticalLine2, DWRsrc_VerticalLine3, DWRsrc_Eduin, DWRsrc_Tree, DWRsrc_Bush, DWRsrc_Arrows, DWRsrc_Potion, DWRsrc_Key, DWRsrc_Gold, DWRsrc_Bow, DWRsrc_Wall, DWRsrc_Door, DWRsrc_Jewel, DWRsrc_Firewall, DWRsrc_Trap, DWRsrc_Orc, DWRsrc_Troll, DWRsrc_RingOfFire;





export void *DWRsrc__init(void)
{
	__DEFMOD;
	__IMPORT(Basic__init);
	__IMPORT(GrFonts__init);
	__IMPORT(Platform__init);
	__REGMOD("DWRsrc", 0);
/* BEGIN */
	DWRsrc_MsDosCga8x8 = GrFonts_MsDosCga8x8;
	Basic_DEFDATA(DWRsrc_Eduin, 8);
	Basic_DATA8(126, 255, 219, 255, 195, 231, 255, 126);
	Basic_DEFDATA(DWRsrc_Jewel, 8);
	Basic_DATA8(16, 56, 124, 254, 124, 56, 16, 0);
	Basic_DEFDATA(DWRsrc_Tree, 8);
	Basic_DATA8(16, 16, 56, 124, 254, 124, 56, 124);
	Basic_DEFDATA(DWRsrc_Bush, 8);
	Basic_DATA8(153, 90, 60, 231, 231, 60, 90, 153);
	Basic_DEFDATA(DWRsrc_Arrows, 8);
	Basic_DATA8(0, 48, 96, 254, 96, 48, 0, 0);
	Basic_DEFDATA(DWRsrc_Potion, 8);
	Basic_DATA8(48, 120, 120, 48, 48, 0, 48, 0);
	Basic_DEFDATA(DWRsrc_Gold, 8);
	Basic_DATA8(48, 124, 192, 120, 12, 248, 48, 0);
	Basic_DEFDATA(DWRsrc_Firewall, 8);
	Basic_DATA8(0, 102, 60, 255, 60, 102, 0, 0);
	Basic_DEFDATA(DWRsrc_Bow, 8);
	Basic_DATA8(28, 48, 48, 224, 48, 48, 28, 0);
	Basic_DEFDATA(DWRsrc_Key, 8);
	Basic_DATA8(118, 220, 0, 0, 0, 0, 0, 0);
	Basic_DEFDATA(DWRsrc_Door, 8);
	Basic_DATA8(0, 0, 255, 0, 255, 0, 0, 0);
	Basic_DEFDATA(DWRsrc_Wall, 8);
	Basic_DATA8(255, 255, 255, 255, 255, 255, 255, 255);
	Basic_DEFDATA(DWRsrc_Trap, 8);
	Basic_DATA8(0, 24, 24, 0, 126, 0, 24, 24);
	Basic_DEFDATA(DWRsrc_Orc, 8);
	Basic_DATA8(56, 108, 198, 198, 108, 108, 238, 0);
	Basic_DEFDATA(DWRsrc_Troll, 8);
	Basic_DATA8(126, 129, 165, 129, 189, 153, 129, 126);
	Basic_DEFDATA(DWRsrc_RingOfFire, 8);
	Basic_DATA8(56, 108, 56, 118, 220, 204, 118, 0);
	Basic_DEFDATA(DWRsrc_CornerLeftUp2, 8);
	Basic_DATA8(255, 128, 128, 128, 128, 128, 128, 128);
	Basic_DEFDATA(DWRsrc_HorizontalLine2, 8);
	Basic_DATA8(255, 0, 0, 0, 0, 0, 0, 0);
	Basic_DEFDATA(DWRsrc_HorizontalLine3, 8);
	Basic_DATA8(0, 0, 0, 0, 0, 0, 0, 255);
	Basic_DEFDATA(DWRsrc_CornerRightDown2, 8);
	Basic_DATA8(1, 1, 1, 1, 1, 1, 1, 255);
	Basic_DEFDATA(DWRsrc_CornerRightUp2, 8);
	Basic_DATA8(255, 1, 1, 1, 1, 1, 1, 1);
	Basic_DEFDATA(DWRsrc_CornerLeftDown2, 8);
	Basic_DATA8(128, 128, 128, 128, 128, 128, 128, 255);
	Basic_DEFDATA(DWRsrc_VerticalLine2, 8);
	Basic_DATA8(128, 128, 128, 128, 128, 128, 128, 128);
	Basic_DEFDATA(DWRsrc_VerticalLine3, 8);
	Basic_DATA8(1, 1, 1, 1, 1, 1, 1, 1);
	Basic_DEFDATA(DWRsrc_VerticalLine, 8);
	Basic_DATA8(24, 24, 24, 24, 24, 24, 24, 24);
	Basic_DEFDATA(DWRsrc_CornerRightUp, 8);
	Basic_DATA8(0, 0, 0, 248, 24, 24, 24, 24);
	Basic_DEFDATA(DWRsrc_CornerLeftDown, 8);
	Basic_DATA8(24, 24, 24, 31, 0, 0, 0, 0);
	Basic_DEFDATA(DWRsrc_HorizontalLine, 8);
	Basic_DATA8(0, 0, 0, 255, 0, 0, 0, 0);
	Basic_DEFDATA(DWRsrc_CornerRightDown, 8);
	Basic_DATA8(24, 24, 24, 248, 0, 0, 0, 0);
	Basic_DEFDATA(DWRsrc_CornerLeftUp, 8);
	Basic_DATA8(0, 0, 0, 31, 24, 24, 24, 24);
	__ENDMOD;
}
