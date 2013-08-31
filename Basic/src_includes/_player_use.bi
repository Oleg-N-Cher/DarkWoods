sub useSword (x as integer, y as integer)
'B        ---> Bush, passable (with sword use) x
'P        ---> Orc,random walking enemy 
'C        ---> Troll,target walking enemy
t$=lcase$(curDMP.lvl(curLevel).map(x,y))
if t$="b" then
	curDMP.lvl(curLevel).map(x,y)=" "
end if
for o=0 to 10
	if orc(o).isAlive=1 and orc(o).x=x and orc(o).y=y then
		orc(o).isAlive=0
		pl.score=pl.score+30
		monsterCount=monsterCount-1
	end if
next o
end sub


sub useBow (xStart as integer, yStart as integer, xMove as integer, yMove as integer)
	done%=0
	x=xStart+xMove
	y=yStart+yMove

	color 15
	locate y+mapYOffset,x*2+mapXOffset: print chr$(254)
	do
		tstart#=timer
		do: loop while timer-tstart#<0.05
		locate y+mapYOffset,x*2+mapXOffset: print " "	
		x=x+xMove
			y=y+yMove
	
		for o=0 to 10
			if orc(o).isAlive=1 and orc(o).x=x and orc(o).y=y then
				orc(o).isAlive=0
				pl.score=pl.score+20
				monsterCount=monsterCount-1
				done%=1
			end if
		next o
		
		for t=0 to 10
			if troll(t).isAlive=1 and troll(t).x=x and troll(t).y=y then
				troll(t).isAlive=0
				pl.score=pl.score+50
				monsterCount=monsterCount-1
				done%=1
			end if
		next t
		
		if curDMP.lvl(curLevel).map(x,y)="" or curDMP.lvl(curLevel).map(x,y)=" " then
			locate y+mapYOffset,x*2+mapXOffset: print chr$(254)	
		else
			done%=1
		end if
	loop until done%=1
end sub


sub useMagic (x,y)
	if curDMP.lvl(curLevel).map(x,y)="" or curDMP.lvl(curLevel).map(x,y)=" " then
		curDMP.lvl(curLevel).map(x,y)="X"
	else 
		pl.spells=pl.spells+1
	end if
end sub