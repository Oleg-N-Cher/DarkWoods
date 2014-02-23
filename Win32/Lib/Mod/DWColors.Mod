MODULE DWColors;
IMPORT Sdl := SdlLib, GrScr, GrColors;

TYPE
  Color* = GrColors.Color;
  Colors* = GrColors.Colors;

VAR
  Eduin-, Tree-, Bush-, Wall-, Door-, Bow-, Arrows-, Potion-, Key-,
  Gold-, Jewel-, Firewall-, Trap-, Orc-, Troll-, RingOfFire-, Frame-
    : Colors;

BEGIN
  Eduin.paper := GrColors.Black;
  Eduin.ink := Sdl.MapRGB(GrScr.Screen.format, 0, 0, 0);
END DWColors.