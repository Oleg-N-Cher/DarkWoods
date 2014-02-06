MODULE Input; (** non-portable *)
IMPORT
  GrScr, lang := java_lang;

TYPE
  Key* = CHAR;
  
(*

Operations

-  Available() returns the number of characters in the keyboard buffer.

-  Read(ch) returns (and removes) the next character from the keyboad buffer. If the buffer is empty, Read waits until a key is pressed.

*)

PROCEDURE WaitEvents;
(*
// http://www.iridix.com/article01.htm

  try
  {
    Thread.sleep(1);
  }
  catch (InterruptedException e)
  {
    ;
  }
*)
BEGIN
  lang.Thread.sleep(1);
  RESCUE
    (
      interruptedException
    )
END WaitEvents;

PROCEDURE Available* (): INTEGER;
BEGIN
  RETURN GrScr.keysAvailable
END Available;

PROCEDURE Read* (): Key;
BEGIN
  WHILE GrScr.keysAvailable = 0 DO WaitEvents END;
  RETURN GrScr.ReadKey()
END Read;

END Input.
