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
  (* LOOP *)
    SemiAction.MainMenu;
  (*END*)
  Kernel.PAUSE(0);
  Kernel.Quit;
END DWoods2.
