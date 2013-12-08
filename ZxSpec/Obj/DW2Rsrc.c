/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "Basic.h"
#include "Platform.h"


export INTEGER DW2Rsrc_FontMsDosCGA8x8, DW2Rsrc_CornerLeftUp, DW2Rsrc_CornerRightUp, DW2Rsrc_CornerLeftDown, DW2Rsrc_CornerRightDown, DW2Rsrc_VerticalLine, DW2Rsrc_HorizontalLine, DW2Rsrc_CornerLeftUp2, DW2Rsrc_HorizontalLine2, DW2Rsrc_HorizontalLine3, DW2Rsrc_CornerRightDown2, DW2Rsrc_CornerRightUp2, DW2Rsrc_CornerLeftDown2, DW2Rsrc_VerticalLine2, DW2Rsrc_VerticalLine3, DW2Rsrc_Face, DW2Rsrc_Tree, DW2Rsrc_Bush, DW2Rsrc_Arrow, DW2Rsrc_Potion, DW2Rsrc_Key, DW2Rsrc_Gold, DW2Rsrc_Bow, DW2Rsrc_Wall, DW2Rsrc_Door, DW2Rsrc_Jewel, DW2Rsrc_Firewall, DW2Rsrc_Trap, DW2Rsrc_Orc, DW2Rsrc_Troll, DW2Rsrc_RingOfFire;





export void *DW2Rsrc__init(void)
{
	__DEFMOD;
	__IMPORT(Basic__init);
	__IMPORT(Platform__init);
	__REGMOD("DW2Rsrc", 0);
/* BEGIN */
	Basic_DEFDATA(DW2Rsrc_Face, 8);
	Basic_DATA8(126, 255, 219, 255, 195, 231, 255, 126);
	Basic_DEFDATA(DW2Rsrc_Jewel, 8);
	Basic_DATA8(16, 56, 124, 254, 124, 56, 16, 0);
	Basic_DEFDATA(DW2Rsrc_Tree, 8);
	Basic_DATA8(16, 16, 56, 124, 254, 124, 56, 124);
	Basic_DEFDATA(DW2Rsrc_Bush, 8);
	Basic_DATA8(153, 90, 60, 231, 231, 60, 90, 153);
	Basic_DEFDATA(DW2Rsrc_Arrow, 8);
	Basic_DATA8(0, 48, 96, 254, 96, 48, 0, 0);
	Basic_DEFDATA(DW2Rsrc_Potion, 8);
	Basic_DATA8(48, 120, 120, 48, 48, 0, 48, 0);
	Basic_DEFDATA(DW2Rsrc_Gold, 8);
	Basic_DATA8(48, 124, 192, 120, 12, 248, 48, 0);
	Basic_DEFDATA(DW2Rsrc_Firewall, 8);
	Basic_DATA8(0, 102, 60, 255, 60, 102, 0, 0);
	Basic_DEFDATA(DW2Rsrc_Bow, 8);
	Basic_DATA8(28, 48, 48, 224, 48, 48, 28, 0);
	Basic_DEFDATA(DW2Rsrc_Key, 8);
	Basic_DATA8(118, 220, 0, 0, 0, 0, 0, 0);
	Basic_DEFDATA(DW2Rsrc_Door, 8);
	Basic_DATA8(0, 0, 255, 0, 255, 0, 0, 0);
	Basic_DEFDATA(DW2Rsrc_Wall, 8);
	Basic_DATA8(255, 255, 255, 255, 255, 255, 255, 255);
	Basic_DEFDATA(DW2Rsrc_Trap, 8);
	Basic_DATA8(0, 24, 24, 0, 126, 0, 24, 24);
	Basic_DEFDATA(DW2Rsrc_Orc, 8);
	Basic_DATA8(56, 108, 198, 198, 108, 108, 238, 0);
	Basic_DEFDATA(DW2Rsrc_Troll, 8);
	Basic_DATA8(126, 129, 165, 129, 189, 153, 129, 126);
	Basic_DEFDATA(DW2Rsrc_RingOfFire, 8);
	Basic_DATA8(56, 108, 56, 118, 220, 204, 118, 0);
	Basic_DEFDATA(DW2Rsrc_CornerLeftUp2, 8);
	Basic_DATA8(255, 128, 128, 128, 128, 128, 128, 128);
	Basic_DEFDATA(DW2Rsrc_HorizontalLine2, 8);
	Basic_DATA8(255, 0, 0, 0, 0, 0, 0, 0);
	Basic_DEFDATA(DW2Rsrc_HorizontalLine3, 8);
	Basic_DATA8(0, 0, 0, 0, 0, 0, 0, 255);
	Basic_DEFDATA(DW2Rsrc_CornerRightDown2, 8);
	Basic_DATA8(1, 1, 1, 1, 1, 1, 1, 255);
	Basic_DEFDATA(DW2Rsrc_CornerRightUp2, 8);
	Basic_DATA8(255, 1, 1, 1, 1, 1, 1, 1);
	Basic_DEFDATA(DW2Rsrc_CornerLeftDown2, 8);
	Basic_DATA8(128, 128, 128, 128, 128, 128, 128, 255);
	Basic_DEFDATA(DW2Rsrc_VerticalLine2, 8);
	Basic_DATA8(128, 128, 128, 128, 128, 128, 128, 128);
	Basic_DEFDATA(DW2Rsrc_VerticalLine3, 8);
	Basic_DATA8(1, 1, 1, 1, 1, 1, 1, 1);
	Basic_DEFDATA(DW2Rsrc_VerticalLine, 8);
	Basic_DATA8(24, 24, 24, 24, 24, 24, 24, 24);
	Basic_DEFDATA(DW2Rsrc_CornerRightUp, 8);
	Basic_DATA8(0, 0, 0, 248, 24, 24, 24, 24);
	Basic_DEFDATA(DW2Rsrc_CornerLeftDown, 8);
	Basic_DATA8(24, 24, 24, 31, 0, 0, 0, 0);
	Basic_DEFDATA(DW2Rsrc_HorizontalLine, 8);
	Basic_DATA8(0, 0, 0, 255, 0, 0, 0, 0);
	Basic_DEFDATA(DW2Rsrc_CornerRightDown, 8);
	Basic_DATA8(24, 24, 24, 248, 0, 0, 0, 0);
	Basic_DEFDATA(DW2Rsrc_CornerLeftUp, 8);
	Basic_DATA8(0, 0, 0, 31, 24, 24, 24, 24);
	__ENDMOD;
}
