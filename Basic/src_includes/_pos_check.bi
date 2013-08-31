function checkPos (x as integer, y as integer)
checkPos=1
t$=lcase$(curDMP.lvl(curLevel).map(x,y))
if t$="t" or t$="w" or t$="v" or t$="r" or t$="b" or t$="x" then 
	checkPos=0
elseif t$="$" then
	pl.score=pl.score+10
	curDMP.lvl(curLevel).map(x,y)=" "
elseif t$="j" then
	pl.score=pl.score+20
	curDMP.lvl(curLevel).map(x,y)=" "
elseif t$="m" then
	pl.spells=pl.spells+2
	curDMP.lvl(curLevel).map(x,y)=" "
elseif t$="k" then
	pl.keys=pl.keys+1
	curDMP.lvl(curLevel).map(x,y)=" "
elseif t$="a" then
	pl.arrows=pl.arrows+3
	curDMP.lvl(curLevel).map(x,y)=" "
elseif t$="d" then
	if pl.keys>0 then
		pl.keys=pl.keys-1
		curDMP.lvl(curLevel).map(x,y)=" "
	else
		checkPos=0
	end if
elseif t$="f" then
	pl.dead=1
	pl.killer=3
elseif t$="i" and curDMP.lvl(curLevel).objectiveType=3 then 
	levelWon=1
elseif t$="y" and curDMP.lvl(curLevel).objectiveType=2 then
	if pl.keys>0 then
		pl.keys=pl.keys-1
		levelWon=1
	else		  
		checkPos=0
	end if
end if
	
if x<1 or y<1 or x>30 or y>15 then checkPos=0

end function


function monsterCheckPos (x as integer, y as integer)
monsterCheckPos=1
t$=lcase$(curDMP.lvl(curLevel).map(x,y))
if t$<>"" and t$<>" " then 
	monsterCheckPos=0	
end if
for o=0 to 10
	if orc(o).isAlive=1 and orc(o).x=x and orc(o).y=y then monsterCheckPos=0
	if orc(o).isAlive=1 and orc(o).x=pl.x and orc(o).y=pl.y then 
		pl.dead=1
		pl.killer=1
	end if
next o
for t=0 to 10
	if troll(t).isAlive=1 and troll(t).x=x and troll(t).y=y then monsterCheckPos=0
	if troll(t).isAlive=1 and troll(t).x=pl.x and troll(t).y=pl.y then
		pl.dead=1
		pl.killer=2
	end if
next t
if x<1 or y<1 or x>30 or y>15 then monsterCheckPos=0
end function
