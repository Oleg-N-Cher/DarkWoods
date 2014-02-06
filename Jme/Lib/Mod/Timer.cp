MODULE Timer; (** non-portable *)
IMPORT
  lang := java_lang;

PROCEDURE Delay* (msec: INTEGER);
BEGIN
  lang.Thread.sleep(msec);
  RESCUE
    (
      interruptedException
    )
END Delay;

END Timer.
