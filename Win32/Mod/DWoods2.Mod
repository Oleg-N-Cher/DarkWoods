MODULE DWoods2; (*$MAIN*)
IMPORT
  Kernel := GrScr, SemiAction;

BEGIN
  (* misc. init *)
  (*==========Math.Randomize;==========*)
  (* init screen *)
  (*==========Scr.Clear(Scr.GrayOnBlue);*)
  (* start stuff *)
  (* LOOP *)
    SemiAction.MainMenu;
  (*END*)
  Kernel.Update;
  Kernel.Close;
END DWoods2.
