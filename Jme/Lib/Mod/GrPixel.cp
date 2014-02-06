MODULE GrPixel; (** non-portable *)
IMPORT
  lcdui := javax_microedition_lcdui,
  GrScr, Cfg := GrCfg;

CONST
  DisActualY = Cfg.DisActualY;

TYPE
  Color* = GrScr.Color;
  Coords* = INTEGER;

VAR
  X: ARRAY Cfg.VirtualWidth + 1 OF Coords;
  Y: ARRAY Cfg.VirtualHeight + 1 OF Coords;

PROCEDURE Ink* (color: Color);
BEGIN
  GrScr.screen.gfx.setColor(color);
END Ink;

(*
PROCEDURE PutActualPixel (x, y: Coords);
BEGIN
  GrScr.screen.gfx.drawLine(x, y, x, y); 
END PutActualPixel;
*)
PROCEDURE Line* (x1, y1, x2, y2: Coords);
BEGIN
  GrScr.screen.gfx.drawLine(x1, y1 + DisActualY, x2, y2 + DisActualY);
END Line;

PROCEDURE PutPixel* (x, y: Coords); (* PutVirtualPixel *)
(*
VAR
  xActual, yActual, xNext, yNext: Coords;
BEGIN
  xActual := x * GrScr.screen.width DIV0 Cfg.VirtualWidth;
  yActual := y * GrScr.screen.height DIV0 Cfg.VirtualHeight;
  xNext := (x + 1) * GrScr.screen.width DIV0 Cfg.VirtualWidth;
  yNext := (y + 1) * GrScr.screen.height DIV0 Cfg.VirtualHeight;
  GrScr.screen.gfx.fillRect(xActual, yActual + DisActualY,
    xNext - xActual, yNext - yActual);
*)BEGIN
  IF ~ Cfg.ChkOutOfScreen OR
    ((x>=0) & (x<Cfg.VirtualWidth) & (y>=0) & (y<Cfg.VirtualHeight)) THEN
      GrScr.screen.gfx.fillRect(X[x], Y[y] + DisActualY,
        X[x + 1] - X[x], Y[y + 1] - Y[y]);
  END;
END PutPixel;

PROCEDURE Init;
VAR
  cor: Coords;
BEGIN
  FOR cor := 0 TO Cfg.VirtualWidth DO
    X[cor] := cor * GrScr.screen.width DIV0 Cfg.VirtualWidth;
  END;
  FOR cor := 0 TO Cfg.VirtualHeight DO
    Y[cor] := cor * GrScr.screen.height DIV0 Cfg.VirtualHeight;
  END;
END Init;

BEGIN
  Init
END GrPixel.
