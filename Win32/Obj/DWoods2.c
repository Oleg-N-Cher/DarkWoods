/*  Ofront 1.2 -xtspkaem */
#include "SYSTEM.h"
#include "GrScr.h"
#include "SemiAction.h"







export main(int argc, char **argv)
{
	__INIT(argc, argv);
	__IMPORT(GrScr__init);
	__IMPORT(SemiAction__init);
	__REGMAIN("DWoods2", 0);
/* BEGIN */
	SemiAction_MainMenu();
	GrScr_Update();
	GrScr_Close();
	__FINI;
}
