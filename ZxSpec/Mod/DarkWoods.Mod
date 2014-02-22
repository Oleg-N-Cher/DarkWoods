MODULE DarkWoods; (*$MAIN*)

IMPORT
  Cfg := DWConfig, Rsrc := DWRsrc,
  ColorsOf := DWColors,
  Scr := Console, GrScr, Input, Timer,
  Fonts := GrFonts, Til := GrTiles, GrCfg;

CONST
  Eduin      = 0X;
  Tree       = 1X;
  Bush       = 2X;
  Wall       = 3X;
  Door       = 4X;
  Bow        = 5X;
  Arrows     = 6X;
  Potion     = 7X;
  Key        = 8X;
  Gold       = 9X;
  Jewel      = 0AX;
  Firewall   = 0BX;
  Trap       = 0CX;
  Orc        = 0DX;
  Troll      = 0EX;
  RingOfFire = 0FX;

  (* Platforms (screen width): *)
  JME = (Cfg.ScreenWidth = 30);
  ZX = (Cfg.ScreenWidth = 32);

TYPE
  Object = CHAR;
  
PROCEDURE ShowSplash;
BEGIN(*
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.YellowOnBlack);
    Scr.WriteLn; Scr.WriteLn; Scr.WriteLn; Scr.WriteLn;
Scr.SetFont(Rsrc.MsDosCga8x8);
    Scr.WriteCh("O"); Scr.WriteInt(1234567);
    GrScr.Update; Timer.Delay(5000);*)
END ShowSplash;

PROCEDURE BlinkEffect (x, y: Scr.Coords; VAR lines: ARRAY OF ARRAY OF CHAR);
VAR
  x1, y1: Til.Coords;
BEGIN
  FOR x1 := 0 TO SHORT(SHORT(LEN(lines, 1))) - 2 DO
    Scr.SetColors(Scr.LWhiteOnBlack);
    FOR y1 := 0 TO SHORT(SHORT(LEN(lines, 0))) - 1 DO
      Scr.At(x + x1, y + y1); Scr.WriteCh(lines[y1, x1]);
    END;
    GrScr.Update; Timer.Delay(10);
    Scr.SetColors(Scr.Blue);
    FOR y1 := 0 TO SHORT(SHORT(LEN(lines, 0))) - 1 DO
      Scr.At(x + x1, y + y1); Scr.WriteCh(lines[y1, x1]);
    END;
  END;
  GrScr.Update;
END BlinkEffect;

PROCEDURE^ ShowIntro;
PROCEDURE^ QuitMenu(): BOOLEAN;

PROCEDURE ShowTitleMenu;
CONST
  SkullX      = Cfg.SkullX;
  SkullY      = Cfg.SkullY;
  FrameX      = Cfg.FrameX;
  FrameY      = Cfg.FrameY;
  FrameWidth  = Cfg.FrameWidth;
  FrameHeight = Cfg.FrameHeight;
  DarkWoodsX  = Cfg.DarkWoodsX;
  DarkWoodsY  = Cfg.DarkWoodsY;
  JockeX      = Cfg.JockeX;
  JockeY      = Cfg.JockeY;
VAR
  cor: Til.Coords; copyright: ARRAY 3 OF ARRAY 18 OF CHAR;
BEGIN LOOP
  Scr.Clear(Scr.Black);

  (* We are from ZX Spectrum world! ;-) *)
  Scr.SetFont(Rsrc.ZxSpecRom8x8);
  IF JME THEN
    Scr.SetColors(Scr.WhiteOnBlue); Scr.WriteStr("DarkWoods Port ");
    Scr.SetColors(Scr.BlueOnCyan); Scr.WriteStr(" VEDAsoft '2014");
  ELSIF ZX THEN
    Scr.SetColors(Scr.WhiteOnBlue); Scr.WriteStr(" DarkWoods Port ");
    Scr.SetColors(Scr.BlueOnCyan); Scr.WriteStr(" VEDAsoft '2014 ");
  ELSE
    Scr.SetColors(Scr.WhiteOnBlue); Scr.WriteStr(" DarkWoods I & II Port ");
    Scr.SetColors(Scr.BlueOnCyan); Scr.WriteStr(" VEDAsoft '2014  ");
  END;
  Scr.SetFont(Rsrc.MsDosCga8x8);

  (* Draw skull: *)
  Scr.SetColors(Scr.GreenOnGreen);
  Scr.At(2 + SkullX, 0 + SkullY); Scr.WriteStr("       ");
  Scr.At(1 + SkullX, 1 + SkullY); Scr.WriteStr("  ");
    Scr.At(4 + SkullX, 1 + SkullY); Scr.WriteStr("   ");
  Scr.At(8 + SkullX, 1 + SkullY); Scr.WriteStr("  ");
  Scr.At(0 + SkullX, 2 + SkullY); Scr.WriteStr("           ");
  Scr.At(1 + SkullX, 3 + SkullY); Scr.WriteStr("         ");
  Scr.At(3 + SkullX, 4 + SkullY); Scr.WriteStr("  ");
    Scr.At(6 + SkullX, 4 + SkullY); Scr.WriteStr("  ");
  Scr.At(3 + SkullX, 5 + SkullY); Scr.WriteStr("     ");
  Scr.At(3 + SkullX, 8 + SkullY); Scr.WriteStr("     ");
  Scr.At(4 + SkullX, 9 + SkullY); Scr.WriteStr("   ");

  (* Draw frame: *)
  Til.DrawMonoTile(FrameX, FrameY, Rsrc.CornerLeftUp, Scr.GreenOnBlack);
  Til.DrawMonoTile(FrameX + FrameWidth - 1, FrameY,
    Rsrc.CornerRightUp, Scr.GreenOnBlack);
  FOR cor := FrameX + 1 TO FrameX + FrameWidth - 2 DO
    Til.DrawMonoTile(cor, FrameY, Rsrc.HorizontalLine, Scr.GreenOnBlack);
    Til.DrawMonoTile(cor, FrameY + FrameHeight - 1,
    Rsrc.HorizontalLine, Scr.GreenOnBlack);
  END;
  FOR cor := FrameY + 1 TO FrameY + FrameHeight - 2 DO
    Til.DrawMonoTile(FrameX, cor, Rsrc.VerticalLine, Scr.GreenOnBlack);
    Til.DrawMonoTile(FrameX + FrameWidth - 1, cor,
      Rsrc.VerticalLine, Scr.GreenOnBlack);
  END;
  Til.DrawMonoTile(FrameX, FrameY + FrameHeight - 1,
    Rsrc.CornerLeftDown, Scr.GreenOnBlack);
  Til.DrawMonoTile(FrameX + FrameWidth - 1,
    FrameY + FrameHeight - 1, Rsrc.CornerRightDown, Scr.GreenOnBlack);
  Scr.SetColors(Scr.GreenOnBlack);
  Scr.At(0 + Cfg.DarkWoodsX, 0 + Cfg.DarkWoodsY); Scr.WriteStr("D A R K");
  Scr.At(3 + Cfg.DarkWoodsX, 2 + Cfg.DarkWoodsY); Scr.WriteStr("W O O D S");

  (* Draw copyright: *)
  copyright[0] := "  Jocke The Beast";
  copyright[1] := "-----------------";
  copyright[2] := "    (C) 2002     ";
  Scr.SetColors(Scr.BlueOnBlack);
  Scr.At(Cfg.JockeX, 0 + Cfg.JockeY); Scr.WriteStr(copyright[0]);
  Scr.At(Cfg.JockeX, 1 + Cfg.JockeY); Scr.WriteStr(copyright[1]);
  Scr.At(Cfg.JockeX, 2 + Cfg.JockeY); Scr.WriteStr(copyright[2]);

  (* Draw main menu: *)
  Scr.At(Cfg.MenuLineX, Cfg.MenuLineY);
  IF JME THEN
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("1)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("Play  ");
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("2)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("Instructions  ");
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("3)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("Quit");
  ELSIF ZX THEN
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("(P)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("lay  ");
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("(I)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("nstructions  ");
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("(Q)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("uit");
  ELSE
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("(P)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("lay    ");
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("(I)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("nstructions    ");
    Scr.SetColors(Scr.CyanOnBlack); Scr.WriteStr("(Q)");
      Scr.SetColors(Scr.MagentaOnBlack); Scr.WriteStr("uit");
  END;
  GrScr.Update;
  BlinkEffect(Cfg.JockeX, Cfg.JockeY, copyright);

  LOOP Scr.At(0,3); Scr.SetColors(Scr.YellowOnBlack);
(*
  Scr.WriteStr("mid.scr="); Scr.WriteBool(GrScr.screen.midlet.scr); Scr.WriteLn;
  Scr.WriteStr("mid.thr="); Scr.WriteBool(GrScr.screen.midlet.thr); Scr.WriteLn;
  Scr.WriteStr("scr.scr="); Scr.WriteBool(GrScr.screen.scr); Scr.WriteLn;
  Scr.WriteStr("scr.thr="); Scr.WriteBool(GrScr.screen.thr); Scr.WriteLn;
  Scr.WriteStr("how="); Scr.WriteInt(GrScr.screen.midlet.how); Scr.WriteLn;
  GrScr.Update;
*)
    IF JME THEN (* A device with numeric keyboard: *)
      CASE Input.Read() OF
      | "1": (*Scr.Clear(Scr.Black);*) (*PlayGame;*) RETURN
      | "2": ShowIntro; EXIT
      | "3": IF QuitMenu() THEN RETURN END; EXIT
      ELSE
      END;
    ELSE (* A device with alphabetic keyboard: *)
      CASE CAP(Input.Read()) OF
      | "P": (*Scr.Clear(Scr.Black);*) (*PlayGame;*) RETURN
      | "I": ShowIntro; EXIT
      | "Q": IF QuitMenu() THEN RETURN END; EXIT
      ELSE
      END;
    END;
  END;
  
END;
END ShowTitleMenu;

PROCEDURE WriteCenter* (IN text: ARRAY OF CHAR);
VAR
  n: Scr.Coords;
BEGIN
  n := SHORT((Cfg.ScreenWidth - SHORT(LEN(text))) DIV 2);
  WHILE n > 0 DO Scr.WriteCh(" "); DEC(n) END;
  Scr.WriteStrLn(text);
END WriteCenter;

PROCEDURE PressAnyKey;
BEGIN
  IF JME THEN (* Cfg.ScreenWidth = 30 *)

    Scr.WriteLn; Scr.SetColors(Scr.GrayOnBlack);
    WriteCenter("Press any key...");
    GrScr.Update; IF Input.Read() = 0X THEN END;
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);
    
  ELSIF ZX THEN (* Cfg.ScreenWidth = 32 *)

    Scr.WriteLn; Scr.SetColors(Scr.OliveOnBlack);
    WriteCenter("Press any key...");
    GrScr.Update; IF Input.Read() = 0X THEN END;
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);

  ELSE (* Cfg.ScreenWidth = 40 *)

    Scr.WriteLn; Scr.SetColors(Scr.GrayOnBlack);
    Scr.WriteStr("           Press any key...");
    GrScr.Update; IF Input.Read() = 0X THEN END;
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);

  END;
END PressAnyKey;

PROCEDURE Draw (x, y: Til.Coords; obj: Object);
BEGIN
  CASE obj OF
  | Eduin     : Til.DrawMonoTile(x, y, Rsrc.Eduin,      ColorsOf.Eduin);
  | Tree      : Til.DrawMonoTile(x, y, Rsrc.Tree,       ColorsOf.Tree);
  | Bush      : Til.DrawMonoTile(x, y, Rsrc.Bush,       ColorsOf.Bush);
  | Wall      : Til.DrawMonoTile(x, y, Rsrc.Wall,       ColorsOf.Wall);
  | Door      : Til.DrawMonoTile(x, y, Rsrc.Door,       ColorsOf.Door);
  | Bow       : Til.DrawMonoTile(x, y, Rsrc.Bow,        ColorsOf.Bow);
  | Arrows    : Til.DrawMonoTile(x, y, Rsrc.Arrows,     ColorsOf.Arrows);
  | Potion    : Til.DrawMonoTile(x, y, Rsrc.Potion,     ColorsOf.Potion);
  | Key       : Til.DrawMonoTile(x, y, Rsrc.Key,        ColorsOf.Key);
  | Gold      : Til.DrawMonoTile(x, y, Rsrc.Gold,       ColorsOf.Gold);
  | Jewel     : Til.DrawMonoTile(x, y, Rsrc.Jewel,      ColorsOf.Jewel);
  | Firewall  : Til.DrawMonoTile(x, y, Rsrc.Firewall,   ColorsOf.Firewall);
  | Trap      : Til.DrawMonoTile(x, y, Rsrc.Trap,       ColorsOf.Trap);
  | Orc       : Til.DrawMonoTile(x, y, Rsrc.Orc,        ColorsOf.Orc);
  | Troll     : Til.DrawMonoTile(x, y, Rsrc.Troll,      ColorsOf.Troll);
  | RingOfFire: Til.DrawMonoTile(x, y, Rsrc.RingOfFire, ColorsOf.RingOfFire);
  ELSE
  END;
END Draw;

PROCEDURE ShowIntro;
BEGIN
  IF JME THEN (* Cfg.ScreenWidth = 30 *)
    (* Page 1: *)
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStr("  : I am "); Draw(1, 0, Eduin);
      Scr.SetColors(Scr.GreenOnBlack); Scr.WriteStr("Eduin");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteStrLn(", the fearless");
    Scr.WriteStrLn("    adventurer.");
      Scr.WriteLn;
    Scr.WriteStrLn(" You can move me around");
    Scr.WriteStr(" using the ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteStrLn("arrow keys.");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteLn;
    Scr.WriteStr(" Press the ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh(".");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(" key and I will");
    Scr.WriteStrLn(" stand still for a turn,");
    Scr.WriteStrLn(" letting the enemies move."); Scr.WriteLn;
    Scr.WriteStr(" Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteStr("SPACE");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by an");
    Scr.WriteStrLn(" arrow key, and I will swing");
    Scr.WriteStrLn(" my trusty sword, destroying");
    Scr.WriteStrLn(" any bushes or Orcs in my way.");
    Scr.WriteStr(" Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("S");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by an");
    Scr.WriteStrLn(" arrow key, and I will shoot");
    Scr.WriteStrLn(" my Bow (if, of course,");
    Scr.WriteStrLn(" I posess a Bow,)");
    Scr.WriteStrLn(" which will kill any enemy.");
    PressAnyKey;

    (* Page 2: *)
    Scr.WriteLn; Scr.WriteStr("  Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("M");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by");
    Scr.WriteStrLn("  an arrow key, and I will");
    Scr.WriteStrLn("  throw a Firewall spell"); Draw(24, 3, Firewall);
    Scr.WriteStrLn("  This spell creates a");
    Scr.WriteStrLn("  firewall (unwalkable).");
      Scr.WriteLn;
    Scr.WriteStr("  Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("+");
      Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" and Eduin will"); Scr.WriteStrLn("  commit suicide.");
      Scr.WriteLn;
    Scr.WriteStr("  Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("F");
      Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" to turn Sound"); Scr.WriteStrLn("  on/off.");
    PressAnyKey;

    (* Page 3: *)
    Scr.WriteStrLn(" : Trees (impassable)"); Draw(0, 0, Tree);
      Scr.WriteLn;
    Scr.WriteStrLn(" : Bushes - these can be"); Draw(0, 2, Bush);
      Scr.WriteStrLn("   hacked away with one swipe");
      Scr.WriteStrLn("   of my Sword.");
      Scr.WriteLn;
    Scr.WriteStrLn(" : Walls or Ruins (impassable)"); Draw(0, 6, Wall);
      Scr.WriteLn;
    Scr.WriteStrLn(" : Door. Opens when you have a"); Draw(0, 8, Door);
      Scr.WriteStrLn("   key and walk into the door.");
      Scr.WriteLn;
    Scr.WriteStrLn(" , : Bow and Arrows. A Arrow"); Draw(0, 11, Bow);
      Scr.WriteStrLn("   mark contains 3 arrows each"); Draw(2, 11, Arrows);
      Scr.WriteLn;
    Scr.WriteStrLn(" : Magic potion. Gives 2 magic");
    Scr.WriteStrLn("   points.");
      Draw(0, 14, Potion); Scr.WriteLn;
    Scr.WriteStrLn(" : Keys. Open doors."); Draw(0, 17, Key);
      Scr.WriteLn;
    Scr.WriteStrLn(" , : Gold and Jewels - bonus");
    Scr.WriteStrLn("   points");
      Draw(0, 19, Gold); Draw(2, 19, Jewel);
    PressAnyKey;

    (* Page 4: *)
    Scr.WriteStrLn(" : Traps. If you are"); Draw(0, 0, Trap);
      Scr.WriteStrLn("   foolish enough to walk");
      Scr.WriteStrLn("   into a trap, you'll die");
      Scr.WriteStrLn("   a horrible death."); Scr.WriteLn;
    Scr.WriteStrLn(" : Orcs.  These can be"); Draw(0, 5, Orc);
      Scr.WriteStrLn("   killed with either a sword,");
      Scr.WriteStrLn("   bowshot or a Firewall");
      Scr.WriteStrLn("   spell."); Scr.WriteLn;
    Scr.WriteStrLn(" : Trolls. They can be killed"); Draw(0, 10, Troll);
      Scr.WriteStrLn("   only by a bowshot."); Scr.WriteLn;
    Scr.WriteStrLn(" : The Ring Of Fire  -- The"); Draw(0, 13, RingOfFire);
      Scr.WriteStrLn("   object of your quest...");
    PressAnyKey;

    (* Page 5: *)
    Scr.SetColors(Scr.BlueOnBlack); WriteCenter("HINTS:");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteLn;
    Scr.WriteStrLn("To complete a Level you'll");
    Scr.WriteStrLn("have to follow the Objectives");
    Scr.WriteStrLn("of the current Level."); Scr.WriteLn;
    Scr.WriteStrLn("If you die and decide to");
    Scr.WriteStrLn("Continue from the last Level,");
    Scr.WriteStrLn("you'll lose 100 points."); Scr.WriteLn;
    Scr.WriteStrLn("You only have one life --");
    Scr.WriteStrLn("make it count."); Scr.WriteLn;
    Scr.WriteStrLn("Don't waste arrows on Orcs --");
    Scr.WriteStrLn("they are easily dispatched");
    Scr.WriteStrLn("with your sword."); Scr.WriteLn;
    Scr.WriteStrLn("Firewall spell makes a");
    Scr.WriteStrLn("unwalkable wall. But remember");
    Scr.WriteStrLn("that you can't remove it."); Scr.WriteLn;
    Scr.WriteStrLn("Keys opens doors.Just walk on");
    Scr.WriteStr("door.");
    PressAnyKey;

  ELSIF ZX THEN (* Cfg.ScreenWidth = 32 *)
    (* Page 1: *)
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStr(" : I am "); Draw(0, 0, Eduin);
      Scr.SetColors(Scr.GreenOnBlack); Scr.WriteStr("Eduin");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteStrLn(", the fearless");
    Scr.WriteStrLn("   adventurer.");
      Scr.WriteLn;
    Scr.WriteStrLn("   You can move me around");
    Scr.WriteStr("   using the ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteStrLn("arrow keys.");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteLn;
    Scr.WriteStr("   Press the ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh(".");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(" key and I will");
    Scr.WriteStrLn("   stand still for a turn,");
    Scr.WriteStrLn("   letting the enemies move."); Scr.WriteLn;
    Scr.WriteStr("   Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteStr("SPACE");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by an");
    Scr.WriteStrLn("   arrow key, and I will swing");
    Scr.WriteStrLn("   my trusty sword, destroying");
    Scr.WriteStrLn("   any bushes or Orcs in my way.");
    Scr.WriteStr("   Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("S");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by an");
    Scr.WriteStrLn("   arrow key, and I will shoot");
    Scr.WriteStrLn("   my Bow (if, of course,");
    Scr.WriteStrLn("   I posess a Bow,)");
    Scr.WriteStrLn("   which will kill any enemy.");
    PressAnyKey;

    (* Page 2: *)
    Scr.WriteLn; Scr.WriteStr("  Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("M");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by an arrow");
    Scr.WriteStrLn("  key, and I will throw");
    Scr.WriteStrLn("  a Firewall spell"); Draw(18, 3, Firewall);
    Scr.WriteStrLn("  This spell creates a");
    Scr.WriteStrLn("  firewall (unwalkable).");
      Scr.WriteLn;
    Scr.WriteStr("  Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("+");
      Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" and Eduin will commit"); Scr.WriteStrLn("  suicide.");
      Scr.WriteLn;
    Scr.WriteStr("  Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("F");
      Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" to turn Sound"); Scr.WriteStrLn("  on/off.");
    PressAnyKey;

    (* Page 3: *)
    Scr.WriteStrLn(" :  Trees (impassable)"); Draw(0, 0, Tree);
      Scr.WriteLn;
    Scr.WriteStrLn(" :  Bushes - these can be"); Draw(0, 2, Bush);
      Scr.WriteStrLn("    hacked away with one swipe");
      Scr.WriteStrLn("    of my Sword.");
      Scr.WriteLn;
    Scr.WriteStrLn(" :  Walls or Ruins (impassable)"); Draw(0, 6, Wall);
      Scr.WriteLn;
    Scr.WriteStrLn(" :  Door. Opens when you have a"); Draw(0, 8, Door);
      Scr.WriteStrLn("    key and walk into the door.");
      Scr.WriteLn;
    Scr.WriteStrLn(" , :Bow and Arrows. A Arrow"); Draw(0, 11, Bow);
      Scr.WriteStrLn("    mark contains 3 arrows each."); Draw(2, 11, Arrows);
    Scr.WriteStrLn(" :  Magic potion. Gives 2 magic");
    Scr.WriteStrLn("    points.");
      Draw(0, 14, Potion); Scr.WriteLn;
    Scr.WriteStrLn(" :  Keys. Open doors."); Draw(0, 17, Key);
      Scr.WriteLn;
    Scr.WriteStrLn(" , :Gold and Jewels - bonus");
    Scr.WriteStrLn("    points");
      Draw(0, 19, Gold); Draw(2, 19, Jewel);
    PressAnyKey;

    (* Page 4: *)
    Scr.WriteStrLn(" :  Traps. If you are"); Draw(0, 0, Trap);
      Scr.WriteStrLn("    foolish enough to walk");
      Scr.WriteStrLn("    into a trap, you'll die");
      Scr.WriteStrLn("    a horrible death."); Scr.WriteLn;
    Scr.WriteStrLn(" :  Orcs.  These can be"); Draw(0, 5, Orc);
      Scr.WriteStrLn("    killed with either a sword,");
      Scr.WriteStrLn("    bowshot or a Firewall spell.");
    Scr.WriteStrLn(" :  Trolls. They can be killed"); Draw(0, 9, Troll);
      Scr.WriteStrLn("    only by a bowshot."); Scr.WriteLn;
    Scr.WriteStrLn(" :  The Ring Of Fire  -- The"); Draw(0, 12, RingOfFire);
      Scr.WriteStrLn("    object of your quest...");
    PressAnyKey;

    (* Page 5: *)
    Scr.SetColors(Scr.BlueOnBlack); WriteCenter("HINTS:");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteLn;
    Scr.WriteStrLn("To complete a Level you'll have");
    Scr.WriteStrLn("to follow the Objectives of the");
    Scr.WriteStrLn("current Level."); Scr.WriteLn;
    Scr.WriteStrLn("If you die and decide to");
    Scr.WriteStrLn("Continue from the last Level,");
    Scr.WriteStrLn("you'll lose 100 points."); Scr.WriteLn;
    Scr.WriteStrLn("You only have one life --");
    Scr.WriteStrLn("make it count."); Scr.WriteLn;
    Scr.WriteStrLn("Don't waste arrows on Orcs --");
    Scr.WriteStrLn("they are easily dispatched with");
    Scr.WriteStrLn("your sword."); Scr.WriteLn;
    Scr.WriteStrLn("Firewall spell makes a");
    Scr.WriteStrLn("unwalkable wall. But remember");
    Scr.WriteStrLn("that you can't remove it."); Scr.WriteLn;
    Scr.WriteStrLn("Keys opens doors.Just walk on");
    Scr.WriteStr("door.");
    PressAnyKey;

  ELSE (* Cfg.ScreenWidth = 40 *)

    (* Page 1: *)
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStr(" :  I am "); Draw(0, 0, Eduin);
      Scr.SetColors(Scr.GreenOnBlack); Scr.WriteStr("Eduin");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteStrLn(", the fearless");
    Scr.WriteStrLn("    adventurer.");
      Scr.WriteLn;
    Scr.WriteStrLn("    You can move me around using the");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteStrLn("    arrow keys.");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteLn;
    Scr.WriteStr("    Press the ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh(".");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(" key and I will stand");
    Scr.WriteStrLn("    still for a turn, letting the");
    Scr.WriteStrLn("    enemies move."); Scr.WriteLn;
    Scr.WriteStr("    Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteStr("SPACE");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by an arrow");
    Scr.WriteStrLn("    key, and I will swing my trusty");
    Scr.WriteStrLn("    sword, destroying any bushes");
    Scr.WriteStrLn("    or Orcs in my way.");
      Scr.WriteLn;
    Scr.WriteStr("    Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("S");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by an arrow");
    Scr.WriteStrLn("    key, and I will shoot my Bow");
    Scr.WriteStrLn("    (if, of course, I posess a Bow,)");
    Scr.WriteStrLn("    which will kill any enemy.");
    PressAnyKey;

    (* Page 2: *)
    Scr.WriteLn; Scr.WriteStr("    Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("M");
      Scr.SetColors(Scr.WhiteOnBlack);
      Scr.WriteStrLn(", followed by an arrow");
    Scr.WriteStrLn("    key, and I will throw");
    Scr.WriteStrLn("    a Firewall spell"); Draw(20, 3, Firewall);
    Scr.WriteStrLn("    This spell creates a");
    Scr.WriteStrLn("    firewall (unwalkable).");
      Scr.WriteLn;
    Scr.WriteStr("    Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("+");
      Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" and Eduin will commit"); Scr.WriteStrLn("    suicide.");
      Scr.WriteLn;
    Scr.WriteStr("    Press ");
      Scr.SetColors(Scr.LGreenOnBlack); Scr.WriteCh("F");
      Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" to turn Sound"); Scr.WriteStrLn("    on/off.");
    PressAnyKey;

    (* Page 3: *)
    Scr.WriteStrLn(" :  Trees (impassable)"); Draw(0, 0, Tree);
      Scr.WriteLn;
    Scr.WriteStrLn(" :  Bushes - these can be hacked away"); Draw(0, 2, Bush);
      Scr.WriteStrLn("    with one swipe of my Sword.");
      Scr.WriteLn;
    Scr.WriteStrLn(" :  Walls or Ruins (impassable)"); Draw(0, 5, Wall);
      Scr.WriteLn;
    Scr.WriteStrLn(" :  Door. Opens when you have a key"); Draw(0, 7, Door);
      Scr.WriteStrLn("    and walk into the door.");
      Scr.WriteLn;
    Scr.WriteStrLn(" , :Bow and Arrows. A Arrow"); Draw(0, 10, Bow);
      Scr.WriteStrLn("    mark contains 3 arrows each."); Draw(2, 10, Arrows);
      Scr.WriteLn;
    Scr.WriteStrLn(" :  Magic potion. Gives 2 magic points.");
      Draw(0, 13, Potion); Scr.WriteLn;
    Scr.WriteStrLn(" :  Keys. Open doors."); Draw(0, 15, Key);
      Scr.WriteLn;
    Scr.WriteStrLn(" , :Gold and Jewels - bonus points");
      Draw(0, 17, Gold); Draw(2, 17, Jewel);
    PressAnyKey;

    (* Page 4: *)
    Scr.WriteStrLn(" :  Traps. If you are"); Draw(0, 0, Trap);
      Scr.WriteStrLn("    foolish enough to walk into a trap,");
      Scr.WriteStrLn("    you'll die a horrible death."); Scr.WriteLn;
    Scr.WriteStrLn(" :  Orcs.  These can be"); Draw(0, 4, Orc);
      Scr.WriteStrLn("    killed with either a sword,bowshot");
      Scr.WriteStrLn("    or a Firewall spell."); Scr.WriteLn;
    Scr.WriteStrLn(" :  Trolls. They can be killed"); Draw(0, 8, Troll);
      Scr.WriteStrLn("    only by a bowshot."); Scr.WriteLn;
    Scr.WriteStrLn(" :  The Ring Of Fire  -- The"); Draw(0, 11, RingOfFire);
      Scr.WriteStrLn("    object of your quest...");
    PressAnyKey;

    (* Page 5: *)
    Scr.SetColors(Scr.BlueOnBlack); WriteCenter("HINTS:");
      Scr.SetColors(Scr.WhiteOnBlack); Scr.WriteLn;
    Scr.WriteStrLn("To complete a Level you'll have to");
    Scr.WriteStrLn("follow the Objectives of the current");
    Scr.WriteStrLn("Level."); Scr.WriteLn;
    Scr.WriteStrLn("If you die and decide to Continue from");
    Scr.WriteStrLn("the last Level,you'll lose 100 points."); Scr.WriteLn;
    Scr.WriteStrLn("You only have one life -- make it count."); Scr.WriteLn;
    Scr.WriteStrLn("Don't waste arrows on Orcs --");
    Scr.WriteStrLn("they are easily dispatched with your");
    Scr.WriteStrLn("sword."); Scr.WriteLn;
    Scr.WriteStrLn("Firewall spell makes a unwalkable wall.");
    Scr.WriteStrLn("But remember that you can't remove it."); Scr.WriteLn;
    Scr.WriteStrLn("Keys opens doors.Just walk on door.");
    PressAnyKey;

  END;
END ShowIntro;

PROCEDURE QuitMenu(): BOOLEAN;
CONST
  QuitMenuX   = Cfg.QuitMenuX;
  QuitMenuY   = Cfg.QuitMenuY;
  QuitTitlePos   = Cfg.QuitTitlePos;
  QuitMenuWidth  = Cfg.QuitMenuWidth;
  QuitMenuHeight = Cfg.QuitMenuHeight;
  QuitThanxX  = Cfg.QuitThanxX;
  QuitThanxY  = Cfg.QuitThanxY;
VAR
  cor: Til.Coords; thanx: ARRAY 2 OF ARRAY 28 OF CHAR;
BEGIN
  Scr.SetColors(Scr.MagentaOnBlack);
  Scr.At(QuitTitlePos, QuitMenuY + 1);
  IF JME THEN
    Scr.WriteStr("Do you really want to Quit?");
  ELSE
    Scr.WriteStr("Do you really want to Quit ?");
  END;
  Scr.At(QuitTitlePos, QuitMenuY + 2);
  IF JME THEN
    Scr.SetColors(Scr.CyanOnBlack);
      Scr.WriteStr("         1)");
    Scr.SetColors(Scr.MagentaOnBlack);
      Scr.WriteStr("Y / ");
    Scr.SetColors(Scr.CyanOnBlack);
      Scr.WriteStr("3)");
    Scr.SetColors(Scr.MagentaOnBlack);
      Scr.WriteStr("N         ");
  ELSE
    Scr.WriteStr("            Y / N           ");
  END;
  IF ~ZX & ~JME THEN
    Scr.At(QuitTitlePos, QuitMenuY + 3);
    Scr.WriteStr("                            ");
  END;

  (* Show frame: *)
  Til.DrawMonoTile(QuitMenuX, QuitMenuY,
    Rsrc.CornerLeftUp2, Scr.MagentaOnBlack);
  Til.DrawMonoTile(QuitMenuX + QuitMenuWidth - 1, QuitMenuY,
    Rsrc.CornerRightUp2, Scr.MagentaOnBlack);
  FOR cor := QuitMenuX + 1 TO QuitMenuX + QuitMenuWidth - 2 DO
    Til.DrawTranspMonoTile(cor, QuitMenuY,
      Rsrc.HorizontalLine2, Scr.MagentaOnBlack);
    Til.DrawTranspMonoTile(cor, QuitMenuY + QuitMenuHeight - 1,
      Rsrc.HorizontalLine3, Scr.MagentaOnBlack);
  END;
  FOR cor := QuitMenuY + 1 TO QuitMenuY + QuitMenuHeight - 2 DO
    Til.DrawMonoTile(QuitMenuX, cor, Rsrc.VerticalLine2, Scr.MagentaOnBlack);
    Til.DrawTranspMonoTile(QuitMenuX + QuitMenuWidth - 1, cor,
      Rsrc.VerticalLine3, Scr.MagentaOnBlack);
  END;
  Til.DrawMonoTile(QuitMenuX, QuitMenuY + QuitMenuHeight - 1,
    Rsrc.CornerLeftDown2, Scr.MagentaOnBlack);
  Til.DrawMonoTile(QuitMenuX + QuitMenuWidth - 1,
    QuitMenuY + QuitMenuHeight - 1, Rsrc.CornerRightDown2, Scr.MagentaOnBlack);

  GrScr.Update;
  LOOP
    IF JME THEN (* A device with numeric keyboard: *)
      CASE Input.Read() OF
      | "1": EXIT
      | "3": RETURN FALSE
      ELSE
      END;
    ELSE
      CASE CAP(Input.Read()) OF
      | "Y": EXIT
      | "N": RETURN FALSE
      ELSE
      END;
    END;
  END;

  thanx[0] := "Thanx for playing DARK WOOD";
  thanx[1] := "by Jocke The Beast.        ";
  Scr.Clear(Scr.Black); Scr.SetColors(Scr.BlueOnBlack);
  Scr.At(QuitThanxX, 0 + QuitThanxY); Scr.WriteStr(thanx[0]);
  Scr.WriteCh("S"); (* YES! This letter not blinks. *)
  Scr.At(QuitThanxX, 1 + QuitThanxY); Scr.WriteStr(thanx[1]);
  BlinkEffect(QuitThanxX, QuitThanxY, thanx);
  Scr.At(0, 4 + QuitThanxY);

  IF JME THEN (* Cfg.ScreenWidth = 30 *)

    Scr.WriteStrLn(" Credits:"); Scr.SetColors(Scr.GreenOnBlack);
    Scr.WriteStrLn(" Game made by:Jocke The Beast");
    Scr.WriteStrLn(" Graphic:     Microsoft ASCII");
    Scr.WriteStrLn(" Idea by:     Zack Johnson");
    Scr.WriteStrLn(" Beta-tester: Jonge");
    Scr.WriteStrLn(" Java port by:Oleg N. Cher"); Scr.WriteLn; Scr.WriteLn;
    Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn("This game is a tribute to Zack");
    Scr.WriteStrLn("Johnson. He made a game called");
    Scr.WriteStrLn("Jungle Raul 1996.");
    Scr.WriteStrLn("A game that I thought was very");
    Scr.WriteStrLn("funny to play, and still do."); Scr.WriteLn;
    Scr.SetColors(Scr.MagentaOnBlack);
    Scr.WriteStrLn(" www.geocities.ws/jockeqbasic");

  ELSIF ZX THEN (* Cfg.ScreenWidth = 32 *)

    Scr.WriteStrLn(" Credits:"); Scr.SetColors(Scr.GreenOnBlack);
    Scr.WriteStrLn(" Game made by:  Jocke The Beast");
    Scr.WriteStrLn(" Graphic:       Microsoft ASCII");
    Scr.WriteStrLn(" Idea by:       Zack Johnson");
    Scr.WriteStrLn(" Beta-tester:   Jonge");
    Scr.WriteStrLn(" Speccy port by:Oleg N. Cher"); Scr.WriteLn; Scr.WriteLn;
    Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" This game is a tribute to Zack");
    Scr.WriteStrLn(" Johnson. He made a game called");
    Scr.WriteStrLn(" Jungle Raul 1996.");
    Scr.WriteStrLn(" A game that I thought was very");
    Scr.WriteStrLn(" funny to play, and still do."); Scr.WriteLn;
    Scr.SetColors(Scr.MagentaOnBlack);
    Scr.WriteStrLn("http://geocities.ws/jockeqbasic");

  ELSE (* Cfg.ScreenWidth = 40 *)

    Scr.WriteStrLn(" Credits:"); Scr.SetColors(Scr.GreenOnBlack);
    Scr.WriteStrLn(" Game made by:    Jocke The Beast");
    Scr.WriteStrLn(" Graphic:         Microsoft ASCII");
    Scr.WriteStrLn(" Idea by:         Zack Johnson");
    Scr.WriteStrLn(" Beta-tester:     Jonge"); Scr.WriteLn; Scr.WriteLn;
    Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" This game is a tribute to Zack Johnson.");
    Scr.WriteStrLn(" He made a game called Jungle Raul 1996.");
    Scr.WriteStrLn(" A game that I thought was very funny");
    Scr.WriteStrLn(" to play, and still do."); Scr.WriteLn;
    Scr.SetColors(Scr.MagentaOnBlack);
    Scr.WriteStrLn(" http://geocities.ws/jockeqbasic");

  END;
  PressAnyKey;
  RETURN TRUE
END QuitMenu;

BEGIN
  REPEAT
    ShowSplash; ShowTitleMenu; GrScr.Close
  UNTIL ~GrCfg.Looped
END DarkWoods.
