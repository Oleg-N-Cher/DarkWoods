MODULE GrFonts;

TYPE
  Font* = POINTER TO ARRAY OF BYTE;
VAR
  ZxSpecRom8x8 *, MsDosCga8x8 * : Font;

END GrFonts.
