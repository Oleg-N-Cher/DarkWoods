/*  Ofront 1.2 -xtspkae */

#ifndef DWColors__h
#define DWColors__h

#include "SYSTEM.h"
#include "SdlLib.h"
#include "GrColors.h"


#define DWColors_Eduin		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xFF, 0xFF, 0x55)})
#define DWColors_Tree		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0x38, 0x71, 0x00)})
#define DWColors_Bush		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0x00, 0xAA, 0x00)})
#define DWColors_Wall		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xAA, 0xAA, 0xAA)})
#define DWColors_Door		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xAA, 0xAA, 0xAA)})
#define DWColors_Bow		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xFF, 0xFF, 0xFF)})
#define DWColors_Arrows	((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xFF, 0xFF, 0xFF)})
#define DWColors_Potion	((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xFF, 0x41, 0x00)})
#define DWColors_Key		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xFF, 0xFF, 0x55)})
#define DWColors_Gold		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xFF, 0xFF, 0x55)})
#define DWColors_Jewel		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xFF, 0xFF, 0x55)})
#define DWColors_Firewall	((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xFF, 0x41, 0x00)})
#define DWColors_Trap		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xAA, 0x00, 0x00)})
#define DWColors_Orc		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xAA, 0x00, 0x00)})
#define DWColors_Troll		((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0xAA, 0x00, 0x00)})
#define DWColors_RingOfFire	((GrColors_Colors) \
				{GrColors_Black, SdlLib_MapRGB(GrScr_Screen->format, 0x00, 0x00, 0xAA)})
#define DWColors_Frame	((GrColors_Colors) \
				{SdlLib_MapRGB(GrScr_Screen->format, 0x45, 0x45, 0x45), GrColors_Black})

#define DWColors__init()


#endif
