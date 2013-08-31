sub gameLoop ()
dim updated as integer
cls
updated=1
do
	k$=inkey$
	select case k$
		case " " 'space, sword
			locate mapYOffset+15+5: print "                                                                                "
			color 4
			tmp$="[ S W O R D ]   U s e   a r r o w s   t o   d i r e c t"
			locate mapYOffset+15+5,40-len(tmp$)/2: print tmp$
			done%=0
			do: k$=inkey$: loop while k$<>""
			do
				k$=inkey$
				select case k$
					case Chr$(255) + "H"' "8" 'up
						useSword pl.x, pl.y-1
						done%=1
					case Chr$(255) + "K" '"4" 'left
						useSword pl.x-1, pl.y
						done%=1
					case Chr$(255) + "P" '"5" 'down
						useSword pl.x, pl.y+1
						done%=1
					case Chr$(255) + "M" '"6" 'right
						useSword pl.x+1, pl.y
						done%=1
				end select
			loop until done%=1
			do: k$=inkey$: loop while k$<>""
			updated=1
		case "s" 's, bow
			if pl.arrows>0 then
				pl.arrows=pl.arrows-1
				locate mapYOffset+15+5: print "                                                                                "
				color 4
				tmp$="[ B O W ]   U s e   a r r o w s   t o   d i r e c t"
				locate mapYOffset+15+5,40-len(tmp$)/2: print tmp$
				done%=0
				do: k$=inkey$: loop while k$<>""
				do
					k$=inkey$
						select case k$
						case Chr$(255) + "H"' "8" 'up
							useBow pl.x, pl.y, 0, -1
							done%=1
						case Chr$(255) + "K" '"4" 'left
							useBow pl.x, pl.y, -1, 0
							done%=1
						case Chr$(255) + "P" '"5" 'down
							useBow pl.x, pl.y, 0, 1
							done%=1
						case Chr$(255) + "M" '"6" 'right
							useBow pl.x, pl.y, 1, 0
							done%=1
					end select
				loop until done%=1
				do: k$=inkey$: loop while k$<>""
				updated=1
			end if
		case "m" 'm, magic firewall
			if pl.spells>0 then
				pl.spells=pl.spells-1
				locate mapYOffset+15+5: print "                                                                                "
				color 4
				tmp$="[ F I R E W A L L ]   U s e   a r r o w s   t o   d i r e c t"
				locate mapYOffset+15+5,40-len(tmp$)/2: print tmp$
				done%=0
				do: k$=inkey$: loop while k$<>""
				do
					k$=inkey$
						select case k$
						case Chr$(255) + "H"' "8" 'up
							useMagic pl.x, pl.y-1
							done%=1
						case Chr$(255) + "K" '"4" 'left
							useMagic pl.x-1, pl.y
							done%=1
						case Chr$(255) + "P" '"5" 'down
							useMagic pl.x, pl.y+1
							done%=1
						case Chr$(255) + "M" '"6" 'right
							useMagic pl.x+1, pl.y
							done%=1
					end select
				loop until done%=1
				do: k$=inkey$: loop while k$<>""
				updated=1
			end if
			
		case Chr$(255) + "H" '"8" 'up
			if checkPos(pl.x,pl.y-1) then pl.y=pl.y-1
			updated=1
		case Chr$(255) + "K" '"4" 'left
			if checkPos(pl.x-1,pl.y) then pl.x=pl.x-1
			updated=1
		case Chr$(255) + "P" '"5" 'down
			if checkPos(pl.x,pl.y+1) then pl.y=pl.y+1
			updated=1
		case Chr$(255) + "M" '"6" 'right
			if checkPos(pl.x+1,pl.y) then pl.x=pl.x+1
			updated=1
		case "."
			updated=1
		
	end select
	
	if updated=1 then
		updated=0
		moveMonsters
		drawMap
		drawInfo
		'check for win/dead conditions here
		if monsterCount=0 and curDMP.lvl(curLevel).objectiveType=1 then levelWon=1
		if pl.dead=1 then
			pl.dead=0
			playerDied
			'sleep
			if deadButContinue=1 then
				oldCurLvl=curLevel
				resetVars
				loadmappack(curDMP.filename)
				curLevel=oldCurLvl
				introduceMap
			else
				exit sub
			end if
		end if
		if levelWon=1 then
			levelWon=0
			'bla
			wonLevel
			if packWon=1 then
				packWon=0
				exit sub
			end if
			updated=1
		end if
	end if
loop while k$<>chr$(27)
end sub


sub moveMonsters ()
for o=0 to 10
	if orc(o).isAlive=1 then
		dir%=int(rnd*12)
		select case dir%
			case 1
				if monsterCheckPos(orc(o).x-1,orc(o).y) then orc(o).x=orc(o).x-1
			case 2
				if monsterCheckPos(orc(o).x+1,orc(o).y) then orc(o).x=orc(o).x+1
			case 3
				if monsterCheckPos(orc(o).x,orc(o).y-1) then orc(o).y=orc(o).y-1
			case 4
				if monsterCheckPos(orc(o).x,orc(o).y+1) then orc(o).y=orc(o).y+1
		end select
	end if
next o

for t=0 to 10
	if troll(t).isAlive=1 and rnd*10>3 then
		xdif=abs(pl.x-troll(t).x)
		ydif=abs(pl.y-troll(t).y)
		xstep=sgn(pl.x-troll(t).x)
		ystep=sgn(pl.y-troll(t).y)
		if monsterCheckPos(troll(t).x+xstep,troll(t).y) then
			troll(t).x=troll(t).x+xstep
		elseif monsterCheckPos(troll(t).x,troll(t).y+ystep) then
			troll(t).y=troll(t).y+ystep
		end if
	end if
next t


end sub


