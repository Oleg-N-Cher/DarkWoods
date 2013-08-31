sub loadmap (filename as string)
	curLevel=0
	fh=freefile
	open filename for input as #fh
	for y=1 to 15
		input #1, tmp$
		for x=1 to 30
			item$=lcase$(mid$(tmp$,x,1))
			curDMP.lvl(curLevel).map(x,y)=item$
		next x
	next y		
	close #fh
	prepareMap
end sub


sub loadmappack (filename as string)
	curDMP.filename=filename
	
	open filename for input as #1
	input #1, curDMP.name
	for l=0 to 6
		input #1, curDMP.wonMsg(l)
		'print curDMP.wonMsg(l): sleep
	next l
	n=0
	orcCount=0
	trollCount=0
	do
		input #1, curDMP.lvl(n).name
		
		input #1, curDMP.lvl(n).objectiveLine(1)
		input #1, curDMP.lvl(n).objectiveLine(2)
		input #1, curDMP.lvl(n).objectiveLine(3)
		for y=1 to 15
			input #1, tmp$
			'print tmp$: sleep
			for x=1 to 30
				item$=lcase$(mid$(tmp$,x,1))
				curDMP.lvl(n).map(x,y)=item$
			next x
		next y
		n=n+1
	loop until eof(1)
	close #1
end sub

sub prepareMap ()
'prepare the map, load pl position, orcs and trolls
'figure objective
curDMP.lvl(curLevel).objectiveType=1
orcCount=0
trollCount=0
for y=1 to 15
	for x=1 to 30
		item$=curDMP.lvl(curLevel).map(x,y)
		curDMP.lvl(curLevel).map(x,y)=""
		if item$="*" then 'player
			pl.x=x
			pl.y=y
		elseif item$="p" then 'orc
			orc(orcCount).x=x
			orc(orcCount).y=y
			orc(orcCount).isAlive=1
			orcCount=orcCount+1
			monsterCount=monsterCount+1
		elseif item$="c" then 'orc
			troll(trollCount).x=x
			troll(trollCount).y=y
			troll(trollCount).isAlive=1
			trollCount=trollCount+1
			monsterCount=monsterCount+1
		else
			curDMP.lvl(curLevel).map(x,y)=item$
		end if
		if item$="y" then 
			curDMP.lvl(curLevel).objectiveType=2
		elseif item$="i" then 
			curDMP.lvl(curLevel).objectiveType=3
		end if
	next x
next y
end sub


sub resetVars ()
	pl.score=0
	pl.arrows=0
	pl.spells=0
	pl.keys=0
	pl.dead=0
	curLevel=0
	levelWon=0
	packWon=0
	deadButContinue=0
	monsterCount=0
	isSingleMap=0
	
	for o=0 to 10
		orc(o).isAlive=0
	next
	
	for t=0 to 10
		troll(t).isAlive=0
	next t
	
	for l=0 to 25
		curDMP.lvl(l).name=""
	next l
end sub
