/*  Ofront 1.2 -xtspkae */
#include "SYSTEM.h"
#include "Basic.h"
#include "SemiAction.h"







export void *DWoods2__init(void)
{
	__DEFMOD;
	__IMPORT(Basic__init);
	__IMPORT(SemiAction__init);
	__REGMOD("DWoods2", 0);
/* BEGIN */
	Basic_Init();
	SemiAction_MainMenu();
	Basic_PAUSE(0);
	Basic_Quit();
	__ENDMOD;
}
