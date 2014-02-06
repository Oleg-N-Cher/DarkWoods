MODULE GrTiles;
IMPORT
  lcdui := javax_microedition_lcdui,
  GrScr, GrPixel;

TYPE
  Color = GrScr.Color;
  Coords* = INTEGER;
  Tile* = lcdui.Image;
  Tile8x8* = ARRAY 8 OF BYTE;
  TranspTile* = ARRAY OF BYTE;
  TranspTile8x8* = ARRAY 8 * 2 OF BYTE;
  MonoTile* = ARRAY OF BYTE;

VAR
  tileWidth, tileHeight, tileStepX, tileStepY: INTEGER;
  
PROCEDURE DrawMonoTile8x8* (
  x, y: Coords; IN tile: MonoTile; colors: GrScr.Colors);
VAR
  mask: INTEGER; byte, bit: SHORTINT;
  ink, paper (*,inkTemp*): Color;
BEGIN
  x := x * 8; y := y * 8;
  ink := SHORT(colors MOD 100000000L);
  paper := SHORT(ASH(colors, -32));
  (*inkTemp := GrPixel.ink;*)
  FOR byte := 0 TO 7 DO
     mask := tile[byte] MOD 100H;
    FOR bit := 0 TO 7 DO
      IF mask < 80H THEN
        GrPixel.Ink(paper);
        GrPixel.PutPixel(x + bit, y);
      ELSE
        GrPixel.Ink(ink);
        GrPixel.PutPixel(x + bit, y);
      END;
      mask := (mask*2) MOD 100H;
    END;
    INC(y);
  END;
  (*GrPixel.Ink(inkTemp);*)
END DrawMonoTile8x8;

PROCEDURE DrawMonoTile* (
  x, y: Coords; IN tile: MonoTile; colors: GrScr.Colors);
BEGIN
  DrawMonoTile8x8(x, y, tile, colors);
END DrawMonoTile;

PROCEDURE DrawTranspMonoTile8x8* (
  x, y: Coords; IN tile: TranspTile; colors: GrScr.Colors);
VAR
  mask, transp: INTEGER; byte, bit: SHORTINT;
  ink, paper (*,inkTemp*): Color;
BEGIN
  x := x * 8; y := y * 8;
  ink := SHORT(colors MOD 100000000L);
  paper := SHORT(ASH(colors, -32));
  (*inkTemp := GrPixel.ink;*)
  FOR byte := 0 TO 7 DO
    mask := tile[byte] MOD 100H;
    transp := tile[byte + 8] MOD 100H;
    FOR bit := 0 TO 7 DO
      IF transp < 80H THEN
        IF mask < 80H THEN
          GrPixel.Ink(paper);
          GrPixel.PutPixel(x + bit, y);
        ELSE
          GrPixel.Ink(ink);
          GrPixel.PutPixel(x + bit, y);
        END;
      END;
      mask := (mask*2) MOD 100H;
      transp := (transp*2) MOD 100H;
    END;
    INC(y);
  END;
  (*GrPixel.Ink(inkTemp);*)
END DrawTranspMonoTile8x8;

PROCEDURE DrawTranspMonoTile* (
  x, y: Coords; IN tile: MonoTile; colors: GrScr.Colors);
BEGIN
  DrawTranspMonoTile8x8(x, y, tile, colors);
END DrawTranspMonoTile;

PROCEDURE DrawTile* (x, y: Coords; tile: Tile);
BEGIN
  GrScr.screen.gfx.drawImage(tile, x * tileStepX, y * tileStepY, 20);
END DrawTile;

PROCEDURE SetSize* (width, height, stepX, stepY: INTEGER);
BEGIN
  tileWidth := width; tileHeight := height;
  tileStepX := stepX; tileStepY := stepY;
END SetSize;

END GrTiles.
