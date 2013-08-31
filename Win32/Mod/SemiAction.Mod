MODULE SemiAction;
IMPORT
  Scr := Console, Til := GrTiles, Fonts := GrFonts,
  Rsrc := DW2Rsrc, Cfg := DW2Config;

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

PROCEDURE MainMenu* ;
VAR
  cor: Til.Coords;
BEGIN
  Scr.Clear(Scr.Black);
  Scr.SetFont(Fonts.ZxSpecRom8x8);

  IF Cfg.DarkWoods1 THEN
    IF Cfg.ScreenWidth = 32 THEN
      Scr.SetColors(Scr.GrayOnBlue); Scr.WriteStr(" DarkWoods Port ");
      Scr.SetColors(Scr.BlueOnCyan); Scr.WriteStr(" VEDAsoft '2013 ");
    ELSE
      Scr.SetColors(Scr.GrayOnBlue); Scr.WriteStr(" DarkWoods I & II Port ");
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
    IF Cfg.ScreenWidth = 32 THEN
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
(*
        color 2,0
        locate 3,3: print "  --              --"
        locate ,3:  print "    --------------"
        locate ,3:  print "  ----  ------  ----        --------------------------------------¬"
        locate ,3:  print "----------------------      ¦                                     ¦"
        locate ,3:  print "  ------------------        ¦   D    A   R   K                    ¦"
        locate ,3:  print "      ----  ----            ¦                                     ¦"
        locate ,3:  print "      ----------            ¦          W   O   O    D    S    2   ¦" 
        locate ,3:  print "      --  --  --            ¦                                     ¦"
        locate ,3:  print "                            L--------------------------------------"
        locate ,3:  print "      --  --  --"
        locate ,3:  print "      ----------"
        locate ,3:  print "        ------"
        color 1,0
        locate ,3:  print "                      J o c k e   T h e   B e a s t"
        locate ,3:  print "                   --------------------------------"
        locate ,3:  print "                          ( C )   2003
        print
        print                                                                                                                                 
        locate ,3: color 3: print "   ( P ) ";: color 5: print "l a y                             ";: color 3: print "( I ) ";: color 5: print "n s t r u c t i o n s"
        print
        locate ,3: color 3: print "   ( L ) ";: color 5: print "o a d   C u s t o m   L e v e l   ";: color 3: print "( Q ) ";: color 5: print "u i t"
	
	do
		k$=inkey$
		if k$<>"" then
			select case lcase$(k$)
				case "p"
					resetVars
					loadmappack("builtin.dmp")
					introduceMap
					gameLoop
					cls
					exit sub
				case "l"
					cls 
					locate 3
					color 7
					input "Input filename of map/mappackage to play (including extension):", filename$
					if fileExists(filename$) then
						'seperate extension to determine filetype (single map/campaign)
						ext$=right(filename$,3)
						
						if ext$="dmp" then 'campaign
							loadmappack(filename$)
							introduceMap
						elseif ext$="dat" then 'single map
							loadmap(filename$)
							isSingleMap=1
						else	'undeterminable
							print "Error, not able to determine type of file (" + filename$ + ")."
							print
							print "Press any key..."
							sleep
							cls
							exit sub	
						end if
						
						gameLoop
						cls
						exit sub
					else
						print "Error, file (" + filename$ + ")does not exists."
						print
						print "Press any key..."
						sleep
						cls
						exit sub
					end if
				case "i"
					showIntroduction
					cls
					exit sub
				case "q"
					exitGame
			end select
		end if
		
	loop while k$<>chr$(27)
	exitGame
end sub
*)

END MainMenu;

END SemiAction.