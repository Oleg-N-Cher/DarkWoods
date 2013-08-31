sub wonPack
	packWon=1
	cls
	color 15
	for l=0 to 6
		locate 4+l*2,40-len(convertToSpacy(curDMP.wonMsg(l)))/2: print convertToSpacy(curDMP.wonMsg(l))
	next
	
	color 14
	tmp$="Your final score was: " + str$(pl.score)
	locate 20,40-len(tmp$)/2: color 8: print tmp$

	
	color 8
	tmp$="Press any key..."
	locate 24,40-len(tmp$)/2: color 8: print tmp$
	
	sleep

end sub


sub wonLevel ()
cls
tmp$="You've completed this level!"
locate 10,40-len(tmp$)/2: color 15: print tmp$
tmp$="Press any key..."
locate 15,40-len(tmp$)/2: color 8: print tmp$
sleep
curLevel=curLevel+1
pl.score=pl.score+100
if curDMP.lvl(curLevel).name="" then
	wonPack
	exit sub
end if


introduceMap
end sub
