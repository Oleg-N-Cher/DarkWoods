MODULE DW2Rsrc;
IMPORT SYSTEM;

(*TYPE
  Font* = ARRAY [1] OF SYSTEM.BYTE;*)

VAR
  CornerLeftUp*, CornerRightUp*, CornerLeftDown*, CornerRightDown*,
  HorizontalLine*, VerticalLine*,
  CornerLeftUp2*, CornerRightUp2*, CornerLeftDown2*, CornerRightDown2*,
  VerticalLine2*, VerticalLine3*,
  Face*, Tree*, Bush*, Wall*, Door*, Bow*, Arrow*, Potion*, Key*,
  Gold*, Jewel*, Firewall*, Trap*, Orc*, Troll*, RingOfFire*
    : ARRAY[1] 8 * 1 OF SYSTEM.BYTE;

  HorizontalLine2*, HorizontalLine3*
    : ARRAY[1] 8 * 2 OF SYSTEM.BYTE;

END DW2Rsrc.