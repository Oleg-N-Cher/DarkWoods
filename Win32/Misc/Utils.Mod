MODULE Utils;
IMPORT IO := Console, Files, Platform, Strings;

TYPE
  STRING = Platform.STRING;
  
(*
function convertToSpacy$ (text as string)
	for p=1 to len(text)
		tmp$=tmp$+mid$(text,p,1)
		tmp$=tmp$+" "
	next p
	convertToSpacy$=tmp$
end function
*)
PROCEDURE ConvertToSpacy* (text: STRING);
VAR
  len, n: INTEGER;
BEGIN
  n := 0; len := SHORT(Strings.Length(text));
	WHILE n < len DO (*FOR n := 0 TO len-1 DO*)
    IO.WriteCh(text[n]); IO.WriteCh(" "); (* Check order! *)
    INC(n);
  END;
END ConvertToSpacy;


(*
sub exitGame
	end
end sub
*)
PROCEDURE ExitGame* ;
BEGIN
  HALT(0)
END ExitGame;



(*
function fileExists( filename as string ) as integer static
    dim f as integer

	fileExists = 0

	if len(filename)=0 then goto exitfunction

	on error goto exitfunction

	f = freefile
	open filename for input as #f

	close #f

	fileExists = -1

exitfunction:
    exit function
end function
*)
PROCEDURE FileExists* (fileName: STRING): BOOLEAN;
BEGIN
  RETURN Files.ExistsFile(fileName)
END FileExists;

END Utils.
