/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "DW2Config.h"
#include "Platform.h"
#include "Console.h"




export void DW2Utils_WriteStrRight (SHORTINT y, CHAR *str, LONGINT str__len);


void DW2Utils_WriteStrRight (SHORTINT y, CHAR *str, LONGINT str__len)
{
	Console_At(33 - (int)str__len, y);
	Console_WriteStr(str, str__len);
}


export void *DW2Utils__init(void)
{
	__DEFMOD;
	__IMPORT(DW2Config__init);
	__IMPORT(Platform__init);
	__IMPORT(Console__init);
	__REGMOD("DW2Utils", 0);
/* BEGIN */
	__ENDMOD;
}
