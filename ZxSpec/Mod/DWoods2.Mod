MODULE DWoods2;
IMPORT
  Kernel := Basic, SemiAction;

BEGIN
  Kernel.Init;
  (* misc. init *)
  (*==========Math.Randomize;==========*)
  (* init screen *)
  (*==========Scr.Clear(Scr.GrayOnBlue);*)
  (* start stuff *)
  SemiAction.MainMenu;
  Kernel.Quit;
END DWoods2.
