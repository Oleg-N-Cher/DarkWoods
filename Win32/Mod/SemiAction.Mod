MODULE SemiAction;
IMPORT
  Scr := Console, GrScr, Til := GrTiles, Fonts := GrFonts, Input,
  Rsrc := DW2Rsrc, Cfg := DW2Config, ColorsOf := DW2Colors;

CONST
  TitleX      = Cfg.TitleX;
  TitleY      = Cfg.TitleY;
  FrameX      = Cfg.FrameX;
  FrameY      = Cfg.FrameY;
  FrameWidth  = Cfg.FrameWidth;
  FrameHeight = Cfg.FrameHeight;
  DarkWoodsX  = Cfg.DarkWoodsX;
  DarkWoodsY  = Cfg.DarkWoodsY;
  JockeX      = Cfg.JockeX;
  JockeY      = Cfg.JockeY;
  QuitMenuX   = Cfg.QuitMenuX;
  QuitMenuY   = Cfg.QuitMenuY;
  QuitTitlePos   = Cfg.QuitTitlePos;
  QuitMenuWidth  = Cfg.QuitMenuWidth;
  QuitMenuHeight = Cfg.QuitMenuHeight;

  Face       = 0X;
  Tree       = 1X;
  Bush       = 2X;
  Wall       = 3X;
  Door       = 4X;
  Bow        = 5X;
  Arrow      = 6X;
  Potion     = 7X;
  Key        = 8X;
  Gold       = 9X;
  Jewel      = 0AX;
  Firewall   = 0BX;
  Trap       = 0CX;
  Orc        = 0DX;
  Troll      = 0EX;
  RingOfFire = 0FX;

  ZX = (Cfg.ScreenWidth = 32);

TYPE
  Object = CHAR;

PROCEDURE Draw (x, y: Til.Coords; obj: Object);
BEGIN
  CASE obj OF
  | Face      : Til.DrawMonoTile(x, y, Rsrc.Face,       ColorsOf.Face);
  | Tree      : Til.DrawMonoTile(x, y, Rsrc.Tree,       ColorsOf.Tree);
  | Bush      : Til.DrawMonoTile(x, y, Rsrc.Bush,       ColorsOf.Bush);
  | Wall      : Til.DrawMonoTile(x, y, Rsrc.Wall,       ColorsOf.Wall);
  | Door      : Til.DrawMonoTile(x, y, Rsrc.Door,       ColorsOf.Door);
  | Bow       : Til.DrawMonoTile(x, y, Rsrc.Bow,        ColorsOf.Bow);
  | Arrow     : Til.DrawMonoTile(x, y, Rsrc.Arrow,      ColorsOf.Arrow);
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

PROCEDURE^ ShowIntro;
PROCEDURE^ QuitMenu(): BOOLEAN;

PROCEDURE MainMenu* ;
VAR
  cor: Til.Coords;
BEGIN LOOP
  Scr.Clear(Scr.Black);
  Scr.SetFont(Fonts.ZxSpecRom8x8);

  IF Cfg.DarkWoods1 THEN
    IF ZX THEN
      Scr.SetColors(Scr.WhiteOnBlue); Scr.WriteStr(" DarkWoods Port ");
      Scr.SetColors(Scr.BlueOnCyan); Scr.WriteStr(" VEDAsoft '2013 ");
    ELSE
      Scr.SetColors(Scr.WhiteOnBlue); Scr.WriteStr(" DarkWoods I & II Port ");
      Scr.SetColors(Scr.BlueOnCyan); Scr.WriteStr(" VEDAsoft '2013  ");
    END;
  ELSE
    Scr.SetColors(Scr.GrayOnBlue); Scr.WriteStr("DarkWoods 2 Port ");
    Scr.SetColors(Scr.BlueOnCyan); Scr.WriteStr(" VEDAsoft '2013");
  END;

  Scr.SetFont(Fonts.MsDosCga8x8);

  IF Cfg.DarkWoods1 THEN (* "DarkWoods 1" title: *)

    Scr.SetColors(Scr.GreenOnGreen);
    Scr.At(2 + TitleX, 0 + TitleY); Scr.WriteStr("       ");
    Scr.At(1 + TitleX, 1 + TitleY); Scr.WriteStr("  ");
      Scr.At(4 + TitleX, 1 + TitleY); Scr.WriteStr("   ");
    Scr.At(8 + TitleX, 1 + TitleY); Scr.WriteStr("  ");
    Scr.At(0 + TitleX, 2 + TitleY); Scr.WriteStr("           ");
    Scr.At(1 + TitleX, 3 + TitleY); Scr.WriteStr("         ");
    Scr.At(3 + TitleX, 4 + TitleY); Scr.WriteStr("  ");
      Scr.At(6 + TitleX, 4 + TitleY); Scr.WriteStr("  ");
    Scr.At(3 + TitleX, 5 + TitleY); Scr.WriteStr("     ");
    Scr.At(3 + TitleX, 8 + TitleY); Scr.WriteStr("     ");
    Scr.At(4 + TitleX, 9 + TitleY); Scr.WriteStr("   ");

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
    Scr.At(0 + DarkWoodsX, 0 + DarkWoodsY); Scr.WriteStr("D A R K");
    Scr.At(3 + DarkWoodsX, 2 + DarkWoodsY); Scr.WriteStr("W O O D S");

    Scr.SetColors(Scr.BlueOnBlack);
    Scr.At(2 + JockeX, 0 + JockeY); Scr.WriteStr(  "Jocke The Beast");
    Scr.At(0 + JockeX, 1 + JockeY); Scr.WriteStr("-----------------");
    Scr.At(4 + JockeX, 2 + JockeY); Scr.WriteStr(    "(C) 2002");

    Scr.At(Cfg.MenuLineX, Cfg.MenuLineY);
    IF ZX THEN
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

  ELSE (* "DarkWoods 2" title: *)

  END;

  GrScr.Update;
  LOOP
    CASE CAP(Input.Read()) OF
    | "P": (*
  					resetVars
	  				loadmappack("builtin.dmp")
		  			introduceMap
  					gameLoop
	  				cls
		  			exit sub *) EXIT
    | "I": ShowIntro; EXIT
    | "Q": IF QuitMenu() THEN RETURN END; EXIT
    ELSE
    END;
  END;
END END MainMenu;

PROCEDURE PressAnyKey;
BEGIN
  IF ZX THEN (* Cfg.ScreenWidth = 32 *)

    Scr.WriteLn; Scr.SetColors(Scr.OliveOnBlack);
    Scr.WriteStr("        Press any key...");
    GrScr.Update; IF Input.Read() = 0X THEN END;
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);

  ELSE (* Cfg.ScreenWidth = 40 *)

    Scr.WriteLn; Scr.SetColors(Scr.GrayOnBlack);
    Scr.WriteStr("           Press any key...");
    GrScr.Update; IF Input.Read() = 0X THEN END;
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);

  END;
END PressAnyKey;

PROCEDURE ShowIntro;
BEGIN
  IF ZX THEN (* Cfg.ScreenWidth = 32 *)
    (* Page 1: *)
    Scr.Clear(Scr.Black); Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStr(" : I am "); Draw(0, 0, Face);
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
      Scr.WriteStrLn("    mark contains 3 arrows each."); Draw(2, 11, Arrow);
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
    Scr.SetColors(Scr.BlueOnBlack); Scr.At(12, 0); Scr.WriteStrLn("HINTS:");
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
    Scr.WriteStr(" :  I am "); Draw(0, 0, Face);
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
      Scr.WriteStrLn("    mark contains 3 arrows each."); Draw(2, 10, Arrow);
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
    Scr.SetColors(Scr.BlueOnBlack); Scr.At(16, 0); Scr.WriteStrLn("HINTS:");
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
VAR
  cor: Til.Coords;
BEGIN
  Scr.SetColors(Scr.MagentaOnBlack);
  Scr.At(QuitTitlePos, QuitMenuY + 1);
    Scr.WriteStr("Do you really want to Quit ?");
  Scr.At(QuitTitlePos, QuitMenuY + 2);
    Scr.WriteStr("            Y / N           ");
  IF ~ZX THEN
    Scr.At(QuitTitlePos, QuitMenuY + 3);
      Scr.WriteStr("                            ");
  END;

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
    Til.DrawMonoTile(QuitMenuX + QuitMenuWidth - 1, cor,
      Rsrc.VerticalLine3, Scr.MagentaOnBlack);
  END;
  Til.DrawMonoTile(QuitMenuX, QuitMenuY + QuitMenuHeight - 1,
    Rsrc.CornerLeftDown2, Scr.MagentaOnBlack);
  Til.DrawMonoTile(QuitMenuX + QuitMenuWidth - 1,
    QuitMenuY + QuitMenuHeight - 1, Rsrc.CornerRightDown2, Scr.MagentaOnBlack);

  GrScr.Update;
  LOOP
    CASE CAP(Input.Read()) OF
    | "Y": EXIT
    | "N": RETURN FALSE
    ELSE
    END;
  END;

  IF ZX THEN (* Cfg.ScreenWidth = 32 *)

    Scr.Clear(Scr.Black); Scr.SetColors(Scr.BlueOnBlack);
    Scr.WriteLn; Scr.WriteLn; Scr.WriteLn; Scr.WriteLn;
    Scr.WriteStrLn("  Thanx for playing DARK WOODS");
    Scr.WriteStrLn("  by Jocke The Beast."); Scr.WriteLn; Scr.WriteLn;
    Scr.WriteStrLn(" Credits:"); Scr.SetColors(Scr.GreenOnBlack);
    Scr.WriteStrLn(" Game made by:  Jocke The Beast");
    Scr.WriteStrLn(" Graphic:       Microsoft ASCII");
    Scr.WriteStrLn(" Idea by:       Zack Johnson");
    Scr.WriteStrLn(" Beta-tester:   Jonge"); Scr.WriteLn; Scr.WriteLn;
    Scr.SetColors(Scr.WhiteOnBlack);
    Scr.WriteStrLn(" This game is a tribute to Zack");
    Scr.WriteStrLn(" Johnson. He made a game called");
    Scr.WriteStrLn(" Jungle Raul 1996.");
    Scr.WriteStrLn(" A game that I thought was very");
    Scr.WriteStrLn(" funny to play, and still do."); Scr.WriteLn;
    Scr.SetColors(Scr.MagentaOnBlack);
    Scr.WriteStr("http://geocities.com/jockeqbasic");

  ELSE (* Cfg.ScreenWidth = 40 *)

    Scr.Clear(Scr.Black); Scr.SetColors(Scr.BlueOnBlack);
    Scr.WriteLn; Scr.WriteLn; Scr.WriteLn; Scr.WriteLn;
    Scr.WriteStrLn("    Thanx for playing DARK WOODS");
    Scr.WriteStrLn("    by Jocke The Beast."); Scr.WriteLn; Scr.WriteLn;
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
    Scr.WriteStrLn(" http://geocities.com/jockeqbasic");

  END;
  PressAnyKey;
  RETURN TRUE
END QuitMenu;

END SemiAction.