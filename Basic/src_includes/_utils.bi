function convertToSpacy$ (text as string)
	for p=1 to len(text)
		tmp$=tmp$+mid$(text,p,1)
		tmp$=tmp$+" "
	next p
	convertToSpacy$=tmp$
end function


sub exitGame
	end
end sub


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

