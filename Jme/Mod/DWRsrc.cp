MODULE DWRsrc;
IMPORT
  lang := java_lang,
  io := java_io,
  GrScr, F := GrFonts;

CONST
  RsrcPathName = "/Rsrc.bin";

TYPE
  Resource = io.InputStream;
  Ident = lang.String;

VAR
  ZxSpecRom8x8-, MsDosCga8x8- : F.Font;
  CornerLeftUp-, CornerRightUp-, CornerLeftDown-, CornerRightDown-,
  HorizontalLine-, VerticalLine-,
  CornerLeftUp2-, CornerRightUp2-, CornerLeftDown2-, CornerRightDown2-,
  VerticalLine2-,
  Eduin-, Tree-, Bush-, Wall-, Door-, Bow-, Arrows-, Potion-, Key-,
  Gold-, Jewel-, Firewall-, Trap-, Orc-, Troll-, RingOfFire-
    : POINTER TO ARRAY (* 8 *) OF BYTE;
  VerticalLine3-, HorizontalLine2-, HorizontalLine3-
    : POINTER TO ARRAY (* 16 *) OF BYTE;

  res: Resource;
  
(*============================================================================*)
(*                            Work with resources                             *)
(*============================================================================*)
PROCEDURE Open (IN name: Ident): Resource;
BEGIN
  RETURN GrScr.screen.midlet.getClass().getResourceAsStream(name);
  RESCUE (exception);
  RETURN NIL
END Open;

PROCEDURE ReadByte (rsrc: Resource): BYTE;
VAR
  abyte: ARRAY 2 OF BYTE;
BEGIN
  IF rsrc.read(abyte, 0, 1) = -1 THEN RETURN 0 END;
  RETURN abyte[0];
  RESCUE (exception);
  RETURN 0
END ReadByte;

PROCEDURE Load (OUT rsrc: POINTER TO ARRAY OF BYTE; size: INTEGER);
VAR
  n: INTEGER;
BEGIN
  NEW(rsrc, size);
  FOR n := 0 TO size - 1 DO rsrc[n] := ReadByte(res) END;
END Load;

PROCEDURE Close (rsrc: Resource);
BEGIN
  rsrc.close;
  RESCUE (exception);
END Close;
(*============================================================================*)

PROCEDURE LoadRsrc;
BEGIN
  res := Open(RsrcPathName);
  Load(MsDosCga8x8, 256 * 8); F.MsDosCga8x8 := MsDosCga8x8;
  Load(ZxSpecRom8x8, 96 * 8); F.ZxSpecRom8x8 := ZxSpecRom8x8;
  Load(VerticalLine, 8);
  Load(CornerRightUp, 8); Load(CornerLeftDown, 8);
  Load(HorizontalLine, 8);
  Load(CornerRightDown, 8); Load(CornerLeftUp, 8);
  Load(VerticalLine2, 8); Load(VerticalLine3, 16);
  Load(CornerRightUp2, 8); Load(CornerLeftUp2, 8);
  Load(HorizontalLine2, 16); Load(HorizontalLine3, 16);
  Load(CornerRightDown2, 8); Load(CornerLeftDown2, 8);
  Load(Eduin, 8); Load(Jewel, 8); Load(Tree, 8); Load(Bush, 8);
  Load(Arrows, 8); Load(Potion, 8); Load(Gold, 8); Load(Firewall, 8);
  Load(Bow, 8); Load(Key, 8); Load(Door, 8); Load(Wall, 8);
  Load(Trap, 8); Load(Orc, 8); Load(Troll, 8); Load(RingOfFire, 8);
  Close(res);
END LoadRsrc;

BEGIN
  LoadRsrc;
END DWRsrc.
