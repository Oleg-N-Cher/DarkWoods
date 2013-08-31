sub drawMap ()
color 8,0
locate y+mapYOffset, mapXOffset
for x=0 to 31
	print chr$(176)+chr$(176);
next x
locate y+mapYOffset+16, mapXOffset
for x=0 to 31
	print chr$(176)+chr$(176);
next x	

for y=1 to 15
	
	locate y+mapYOffset, mapXOffset
	color 8,0: print chr$(176)+chr$(176);
	for x=1 to 30	
		select case lcase$(curDMP.lvl(curLevel).map(x,y))
			case "w"
				color 7,0
				print "ÛÛ";
            case "r"
                color 7,0
                print "±±";
            case "v"
                color 0,7
                print "()";
            case "b"
                color 2,0
                print "><";
            case "j"
                color 12,0
                print "<>";
            case "$"
                color 14,0
                print "()";
            case "k"
                color 15,0
                print "*»";
            case "a"
                color 6,0
                print "<-";
			case "d","y"
				color 7,0
				print "==";
			case "f"
				color 0,4
				print "[]";
			case "i"
				color 1,0
				print "&-";
			case "m"
				color 9,0
				print "\/";
			case "x"
				color 12,0
				print "**";
			case "t"
				color 2,0
				print chr$(5)+chr$(5);
			case else
				color 7,0
				print "  ";
		end select
	next x
	color 8: print chr$(176)+chr$(176);
next y

locate pl.y+mapYOffset,pl.x*2+mapXOffset: color 14,0: print "\"

for o=0 to 10
	if orc(o).isAlive=1 then
		locate orc(o).y+mapYOffset,orc(o).x*2+mapXOffset: color 4,0: print "™-"

	end if
next o

for t=0 to 10
	if troll(t).isAlive=1 then
		locate troll(t).y+mapYOffset,troll(t).x*2+mapXOffset: color 4,0: print "-"
	end if
next t
end sub


sub drawInfo
'level score arrows
'keys        magic
color 6
locate mapYOffset+15+2,1: print convertToSpacy(curDMP.lvl(curLevel).name)
tmp$="S c o r e :   "+str$(pl.score)
locate mapYOffset+15+2,40-len(tmp$)/2: print tmp$
tmp$="A r r o w s :   "+str$(pl.arrows)
locate mapYOffset+15+2,80-len(tmp$): print tmp$

tmp$="K e y s :   "+str$(pl.keys)
locate mapYOffset+15+3,1: print tmp$
tmp$="M a g i c :   "+str$(pl.spells)
locate mapYOffset+15+3,80-len(tmp$): print tmp$

locate mapYOffset+15+4,1: print "--------------------------------------------------------------------------------"

color 2
locate mapYOffset+15+5: print "                                                                                "
locate mapYOffset+15+5,1: print "S p a c e   =   S w o r d      S   =   B o w      M   =   M a g i c"
color 10
locate mapYOffset+15+6,1: print "I = I n s t r u c t i o n s                       E S C   =   Q u i t"
'print levelWon; ":.:"; monsterCount; ":.:"; curDMP.lvl(curLevel).objectiveType
end sub
