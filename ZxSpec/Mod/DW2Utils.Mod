MODULE DW2Utils;
IMPORT Platform, Scr := Console, (*Strings,*) Dw2Config;

TYPE
  STRING = Platform.STRING;

PROCEDURE WriteStrRight* (y: Scr.Coords; (*IN*) str: STRING);
BEGIN
  Scr.At(Dw2Config.ScreenWidth + 1 - SHORT(LEN(str)), y);
  Scr.WriteStr(str);
END WriteStrRight;

END DW2Utils.
