/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "Basic.h"
#include "Platform.h"


export INTEGER DW2Rsrc_FontMsDosCGA8x8, DW2Rsrc_CornerLeftUp, DW2Rsrc_CornerRightUp, DW2Rsrc_CornerLeftDown, DW2Rsrc_CornerRightDown, DW2Rsrc_VerticalLine, DW2Rsrc_HorizontalLine;





export void *DW2Rsrc__init(void)
{
	__DEFMOD;
	__IMPORT(Basic__init);
	__IMPORT(Platform__init);
	__REGMOD("DW2Rsrc", 0);
/* BEGIN */
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
