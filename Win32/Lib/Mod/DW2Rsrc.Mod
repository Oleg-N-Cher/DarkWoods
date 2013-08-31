MODULE DW2Rsrc;
IMPORT SYSTEM;

(*TYPE
  Font* = ARRAY [1] OF SYSTEM.BYTE;*)

VAR
  CornerLeftUp*, CornerRightUp*, CornerLeftDown*, CornerRightDown*,
  HorizontalLine*, VerticalLine*
    : ARRAY [1] 8 * 1 OF SYSTEM.BYTE;

END DW2Rsrc.