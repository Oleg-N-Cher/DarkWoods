sub mainmenu ()
view print 2 to 25
        color , 0
	cls

	locate 1,1
	color 7,1
	print "DarkWoods II - FB Port       "
	
	stri$="Originally by Jocke The Beast, ported by RAJM, 2004"
	locate 1, 81 - len(stri$)
	print stri$

        color 2,0
        locate 3,3: print "  лл              лл"
        locate ,3:  print "    лллллллллллллл"
        locate ,3:  print "  лллл  лллллл  лллл        кФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФП"
        locate ,3:  print "лллллллллллллллллллллл      Г                                     Г"
        locate ,3:  print "  лллллллллллллллллл        Г   D    A   R   K                    Г"
        locate ,3:  print "      лллл  лллл            Г                                     Г"
        locate ,3:  print "      лллллллллл            Г          W   O   O    D    S    2   Г" 
        locate ,3:  print "      лл  лл  лл            Г                                     Г"
        locate ,3:  print "                            РФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФй"
        locate ,3:  print "      лл  лл  лл"
        locate ,3:  print "      лллллллллл"
        locate ,3:  print "        лллллл"
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


sub introduceMap

prepareMap

'show intro
cls
color 14
locate 3,40-len(convertToSpacy(curDMP.name))/2: print convertToSpacy(curDMP.name)
locate 5,40-len(convertToSpacy(curDMP.lvl(curLevel).name))/2: print convertToSpacy(curDMP.lvl(curLevel).name)
color 8
locate 10,40-len(convertToSpacy(curDMP.lvl(curLevel).objectiveLine(1)))/2: print convertToSpacy(curDMP.lvl(curLevel).objectiveLine(1))
locate 12,40-len(convertToSpacy(curDMP.lvl(curLevel).objectiveLine(2)))/2: print convertToSpacy(curDMP.lvl(curLevel).objectiveLine(2))
locate 14,40-len(convertToSpacy(curDMP.lvl(curLevel).objectiveLine(3)))/2: print convertToSpacy(curDMP.lvl(curLevel).objectiveLine(3))

objective$="Objective: "
select case curDMP.lvl(curLevel).objectiveType
	case 1
		objective$=objective$+"Kill all enemies"
	case 2
		objective$=objective$+"Find the way out"
	case 3
		objective$=objective$+"Find the magic item"
end select

color 2
locate 17,40-len(convertToSpacy(objective$))/2: print convertToSpacy(objective$)

color 7
tmp$="Press any key..."
locate 21,40-len(convertToSpacy(tmp$))/2: print convertToSpacy(tmp$)
sleep
cls

end sub


sub showIntroduction ()
	dim pages(1 to 6, 1 to 23) as string
	fh=freefile
	open "introduction.dat" for input as #fh
	p=1
	l=1
	do
		l=l+1
		line input #fh, tmp$
		if tmp$="^" then
			p=p+1
			l=1
		else
			pages(p,l)=tmp$
		end if
	loop until eof(fh)
	close #fh
	
	cls
	
	for p=1 to 6
		color 7,0
		cls
		print ""
		for l=1 to 23
			if pages(p,l)<>"" then 
				print pages(p,l)
			else
				print ""
			end if
		next l
		
		text$="<Any key to continue>"
		locate 24,40-len(text$)/2: color 8: print text$
		
		locate 1,1
		color 7,1
		print "DarkWoods II - FB Port       "
		stri$="Originally by Jocke The Beast, ported by RAJM, 2004"
		locate 1, 81 - len(stri$)
		print stri$
		
		sleep
	next p
end sub

sub playerDied ()
'blood animation
dim bline(1 to 80) as integer
color 4,0
for i=1 to 30
	for x=1 to 80
		if rnd*100>50 then 
			bline(x)=bline(x)+1
			if rnd*100>5 then locate bline(x)+1,x: print "л";
		end if
	next x
	tstart#=timer
	do: loop while timer-tstart#<0.05
next i

tmp$=" < Press any key > "
locate 2,40-len(tmp$)/2: print tmp$

do:loop while inkey$<>""

'show killer-text-thing, continue/restart options, and score
cls
dim killer_text(1 to 5) as string
select case pl.killer
	case 1 'orc
		killer_text(1)="Eduin is strangled and absorbed"
		killer_text(2)="by the fierce Orcs."
		killer_text(3)="His bones litter the ground, a"
		killer_text(4)="sinister testament to his"
		killer_text(5)="foolishness."
	case 2 'troll
		killer_text(1)="Eduin is savagely beheaded,"
		killer_text(2)="chopped into pieces, and later"
		killer_text(3)="eaten by the indigent Trolls."
	case 3 'trap
		killer_text(1)="Eduin walked into a trap!"
		killer_text(2)="What a foolish way for an"
		killer_text(3)="adventurer to end his life."
	case 4 'suicide
		killer_text(1)="Eduin, a adventurer with"
		killer_text(2)="honour and pride.
		killer_text(3)="Commited suicide when"
		killer_text(4)="the defeat was a fact."
end select

locate 10
color 2
for i=1 to 5
	locate , 40-len(convertToSpacy$(killer_text(i)))/2
	print convertToSpacy$(killer_text(i))
next 
print ""
print ""

text$="Your final score: "+str$(pl.score)+" pts."
locate ,40-len(convertToSpacy$(text$))/2
color 3
print convertToSpacy$(text$)

print ""
print ""
locate ,3: color 3: print "         ( C ) ";: color 5: print "o n t i n u e                       ";: color 3: print "( R ) ";: color 5: print "e s t a r t"

do:k$=inkey$:loop until lcase$(k$)="c" or lcase$(k$)="r"

if k$="c" then deadButContinue=1

end sub
