MODULE GrCfg;

CONST
  AppTitle* = "DarkWoods";
  MainClass* = "CP.DarkWoods.DarkWoods";

  (* 240x291 *)
  VirtualWidth* = 240;
  VirtualHeight* = (291 DIV 3) * 2;

  ChkOutOfScreen* = FALSE;
  DisActualY* = 1;
  Looped* = TRUE; (* Used WTK fix For Java ME *)

END GrCfg.
