MODULE DWRsrc;
IMPORT SYSTEM, GrFonts;

VAR
    MsDosCga8x8-: ARRAY [1] 2048 OF SYSTEM.BYTE;
    ZxSpecRom8x8-: ARRAY [1] 768 OF SYSTEM.BYTE;

  CornerLeftUp*, CornerRightUp*, CornerLeftDown*, CornerRightDown*,
  HorizontalLine*, VerticalLine*,
  CornerLeftUp2*, CornerRightUp2*, CornerLeftDown2*, CornerRightDown2*,
  VerticalLine2*,
  Eduin*, Tree*, Bush*, Wall*, Door*, Bow*, Arrows*, Potion*, Key*,
  Gold*, Jewel*, Firewall*, Trap*, Orc*, Troll*, RingOfFire*
    : ARRAY[1] 8 * 1 OF SYSTEM.BYTE;

  VerticalLine3*, HorizontalLine2*, HorizontalLine3*
    : ARRAY[1] 8 * 2 OF SYSTEM.BYTE;

END DWRsrc.