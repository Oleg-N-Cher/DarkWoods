MODULE DW2Colors;
IMPORT Sdl := SdlLib, GrScr, GrColors;

TYPE
  Color* = GrColors.Color;
  Colors* = GrColors.Colors;

VAR
  Face-, Tree-, Bush-, Wall-, Door-, Bow-, Arrow-, Potion-, Key-,
  Gold-, Jewel-, Firewall-, Trap-, Orc-, Troll-, RingOfFire-
    : Colors;

BEGIN
  Face.paper := GrColors.Black;
  Face.ink := Sdl.MapRGB(GrScr.Screen.format, 0, 0, 0);
END DW2Colors.