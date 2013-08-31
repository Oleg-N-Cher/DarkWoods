{$APPTYPE CONSOLE}
PROGRAM Durak;

USES Windows, KOL;

{$R *.RES}

VAR
  src: AnsiString; n, srcLen: INTEGER;

BEGIN
  src := Kol.StrLoadFromFile(ParamStr(1)); srcLen := LENGTH(src);
  FOR n := 1 TO srcLen DO BEGIN
    WRITE(Kol.Int2Hex(ORD(src[n]), 3), 'H,');
    IF n MOD 8 = 0 THEN WriteLn;
  END;
END {Durak}.
