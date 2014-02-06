(* Universal graphic library for Oberon-2 (GPCP) for Java ME. *)
(*           Copyright (c) 2012-2014, Oleg N. Cher            *)
(*        VEDAsoft Oberon Club - http://zx.oberon2.ru         *)

(*============================================================================*)
(*                            CP.GrScr.GrScr.class                            *)
(*============================================================================*)
MODULE GrScr; (** non-portable *)
(* Thanks to Raydac (Igor A. Maznitsa) for consultations. *)

IMPORT
  lcdui := javax_microedition_lcdui,  (* J2ME display. *)
  midlet := javax_microedition_midlet, (* J2ME midlet. *)
  lang := java_lang,    (* Base Java language library. *)
  GrCfg; (* Configuration module. Don't add it to JAR. *)

CONST
  KeyBufSize = 32; NoKey = 0X;
  WTKfix = TRUE;

TYPE
  Midlet* = POINTER TO RECORD (midlet.MIDlet)
    screen-: Screen;
    display-: lcdui.Display;
    threadStarted-: BOOLEAN;
  END;
  
  Screen* = POINTER TO RECORD (lcdui.Canvas + lang.Runnable)
    width-, height-: INTEGER;
    gfx-: lcdui.Graphics;
    midlet-: Midlet;
  END;

  Color* = INTEGER;
  Colors* = LONGINT;

  Key = CHAR;

VAR
  screen-: Screen;
  img: lcdui.Image;
  keysAvailable-, keyIn, keyOut: INTEGER;
  keyBuf: ARRAY KeyBufSize OF Key;
    
(*PROCEDURE^ Ohoho;*)
(*============================================================================*)
(*                         CP.GrScr.GrScr_Midlet.class                        *)
(*============================================================================*)
PROCEDURE Init* (): Midlet, BASE (); (* Midlet's CONSTRUCTOR *)
BEGIN
  SELF.screen := NIL;
  SELF.threadStarted := FALSE;
  RETURN SELF;
END Init;

(*----------------------------------------------------------------------------*)
PROCEDURE (midlet: Midlet) startApp* ;
(** ����� ����� - ���������� ����� JVM ��� ������� ������ ����������. *)
BEGIN
  (* ��������� ������ �� ������ Display ������ javax.microedition.lcdui
     ��� ������ � �������, ������� (javax.microedition.lcdui.Form) ��� ��
     ������� (javax.microedition.lcdui.Canvas) � ������������ ����� ����. *)
  midlet.display := lcdui.Display.getDisplay(midlet);
  IF midlet.screen = NIL THEN (* ���� ����� ��� �� ����������, ������� ���. *)
    NEW(midlet.screen);
    midlet.screen.midlet := midlet;
  ELSE (* ����� ���������� � ������; ������ ���������� ���. *)
    midlet.screen.repaint;
    midlet.screen.serviceRepaints;
  END;
  (* ��������! startApp ������ ����������� ����������� ������, ��� ���
     ��� ��������� ����������� �� ���������� ����������� ������ �����������,
     ��������� ������� ���� ���������� ����� ������, ��������,
     ���� 20 ������ ����� ������, �� �����, ��� �������, � �����.
     ������ � ���� ����� �� ������ ��������� ���������� � ������ �����. *)

  (* ���� ����� ����������, �� ��������� ���� ������; ����� �������� ���. *)
  IF ~midlet.threadStarted THEN (* �������� ���������� Runnable.run *)
    lang.Thread.Init(midlet.screen).start; (* � ����� ������. *)
    midlet.threadStarted := TRUE;
  END;
END startApp;

(*----------------------------------------------------------------------------*)
PROCEDURE (midlet: Midlet) pauseApp* ;
(** ���������� ����� VM ����� �� ���� ���������� ��������� ������, SMS � �.�. *)
END pauseApp;

(*----------------------------------------------------------------------------*)
PROCEDURE (midlet: Midlet) destroyApp* (c: BOOLEAN);
(** ���������� �����, ����� �� ����������. *)
(* ������ ����� ������, ��� ����������� � ����������, � �� �����
   ��� ������������ ������ �� �� ����. ������ startApp() � pauseApp()
   ������������ ����� AMS, � destroyApp() - ���. �� ����������� ��������
   ������ ���� ������ ������� �������� ��������� �������:

   public void destroyApp(boolean unconditional) {
     notifyDestroyed(); // ������ ����� ��������� ���� ����������
   }

   ��� �� ������ ������, ������������ ����� ����� ���������� ���������
   ������� notifyDestroyed(), � �� destroyApp(). �� �� �����,
   �������������� ��������� ��� � ��������� ������... *)

(*
    public void destroyApp(boolean flag)
    {
        m = null;   // extends Canvas implements Runnable
        M.I = null; // lcdui.Image
        M.G = null; // lcdui.Graphics
        CD = null;
        TB = null;
        F = null;
        A = null;
        L = null;
        fw = null;
        LC = null;
        notifyDestroyed();
    }
*)
END destroyApp;

(*============================================================================*)
(*                         CP.GrScr.GrScr_Screen.class                        *)
(*============================================================================*)
PROCEDURE (screen: Screen) paint* (graphics: lcdui.Graphics);
(** ��������� Runnable - ���������� ����� VM, ����� ����� ������������ �����. *)
BEGIN
  graphics.drawImage(img, 0, 0, 20);
END paint;

(*----------------------------------------------------------------------------*)
PROCEDURE (self: Screen) run* , NEW;
(** ������� ������� ����� ���������� � ����� ��� ���������� (� ����� BEGIN). *)
BEGIN
  IF screen = NIL THEN
    screen := self;
    IF img = NIL THEN
      screen.width := screen.getWidth();
      screen.height := screen.getHeight();
      img := lcdui.Image.createImage(screen.width, screen.height);
    END;
  ELSE
    screen.midlet := self.midlet;
    IF img = NIL THEN
      screen.midlet.display := lcdui.Display.getDisplay(screen.midlet);
      screen.width := screen.getWidth();
      screen.height := screen.getHeight();
      img := lcdui.Image.createImage(screen.width, screen.height);

      IF screen.gfx = NIL THEN screen.gfx := img.getGraphics() END;
      screen.midlet.display.setCurrent(screen);
      (*Ohoho;*)
    END;
    (*screen.midlet.display := self.midlet.display;*)
  END;
  IF screen.gfx = NIL THEN screen.gfx := img.getGraphics() END;
  screen.midlet.display.setCurrent(screen);
  keysAvailable := 0; keyIn := 0; keyOut := 0;
  (* ������� ������ �� ������� ����� � �������� ���. *)
  IF lang.Class.forName(GrCfg.MainClass) # NIL THEN END;
  (*screen.midlet.notifyDestroyed();*)
  (* �� ����������� ����������� ���������� ����������: *)
  (* "Java application has thrown Exception and will be closed". *)
  RESCUE
    (
      exception
    );
  screen.midlet.notifyDestroyed()
END run;

(*----------------------------------------------------------------------------*)
PROCEDURE (screen: Screen) keyPressed* (keyCode: INTEGER);
BEGIN
  (* Add a key: *)
  keyBuf[keyIn] := CHR(keyCode);
  keyIn := (keyIn+1) MOD KeyBufSize;
  INC(keysAvailable);
END keyPressed;

(*============================================================================*)
PROCEDURE Clear* (color: INTEGER); (* �������� ���� ����� ������ color. *)
VAR
  oldcolor: INTEGER;
BEGIN
  oldcolor := screen.gfx.getColor();
  screen.gfx.setColor(color);
  screen.gfx.fillRect(0, 0, screen.width, screen.height);
  screen.gfx.setColor(oldcolor);
END Clear;

PROCEDURE Update* ; (** ������������ ����� �� ������. *)
BEGIN
  screen.repaint;
  screen.serviceRepaints;
END Update;

PROCEDURE ReadKey* (): Key; (** ������ ��� ������� �� ������. *)
VAR
  key: Key;
BEGIN
  IF keysAvailable = 0 THEN RETURN NoKey END;
  DEC(keysAvailable);
  key := keyBuf[keyOut];
  keyOut := (keyOut+1) MOD KeyBufSize;
  RETURN key
END ReadKey;

(*
PROCEDURE Ohoho;
BEGIN Clear(0FF0000H); Update; lang.Thread.sleep(500);
Clear(0FFH); Update; lang.Thread.sleep(500);
Clear(0FF00H); Update; lang.Thread.sleep(500);
END Ohoho;
*)

PROCEDURE Close* ; (** ������� ����������. *)
VAR
  midlet: Midlet;
BEGIN
  midlet := screen.midlet;
  IF ~WTKfix THEN
    screen.midlet.screen := NIL;
    screen.midlet := NIL;
    screen.gfx := NIL;
    screen := NIL;
    img := NIL;
  END;
  midlet.notifyDestroyed()
END Close;

END GrScr.
