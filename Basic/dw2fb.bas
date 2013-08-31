'Dark Woods 2 - FreeBasic Port - Release 1
'Coded by RAJM, December 2004 <RuneMoennike@hotmail.com>
'Original Dark Woods 2 by Jocke the Beast <jockebeast@hotmail.com>

'If you use this code for anything, you MUST include the sourcecode within your release,
'and you MUST give credits to RAJM and Jocke the Beast, and include both of these persons
'email addresses.

'load_and_init.bi:
	declare sub loadmappack (filename as string)
	declare sub loadmap (filename as string)
	declare sub prepareMap ()
	declare sub resetVars ()
	
'render.bi:
	declare sub drawMap ()
	declare sub drawInfo ()
	
'utils.bi:
	declare function convertToSpacy$ (text as string)
	declare sub exitGame ()
	declare function fileExists(filename as string) as integer

'semi_action.bi:
	declare sub showIntroduction ()
	declare sub mainMenu ()
	declare sub introduceMap ()
	declare sub playerDied ()

'winning.bi:
	declare sub wonLevel ()
	declare sub wonPack ()

'base_game.bi:
	declare sub gameLoop ()
	declare sub moveMonsters ()

'pos_check.bi:
	declare function checkPos (x as integer, pl.y as integer)
	declare function monsterCheckPos (x as integer, y as integer)

'player_use.bi
	declare sub useSword (x as integer, y as integer)
	declare sub useBow (xStart as integer, yStart as integer, xMove as integer, yMove as integer)
	declare sub useMagic (x as integer, y as integer)


'types
type lvlType
	name as string
	map(30,15) as string
	objectiveType as integer '1=kill all, 2=find door, 3=find item
	objectiveLine(1 to 3) as string
end type

type mapPackageType
	filename as string
	name as string
	lvl(25) as lvlType
	wonMsg(0 to 6) as string
end type

type playerType
	x as integer
	y as integer
	arrows as integer
	spells as integer
	score as integer
	keys as integer
	dead as integer
	killer as integer '1..4 = {orc, troll, trap, suicide}
end type

type monsterType
	x as integer
	y as integer
	isAlive as integer
end type
	
'constants
const mapXOffset=10, mapYOffset=2

'shared variables and arrays
dim shared curDMP as mapPackageType, curLevel as integer
dim shared pl as playerType
dim shared orc(10) as monsterType, troll(10) as monsterType, monsterCount as integer
dim shared levelWon as integer, packWon as integer
dim shared deadButContinue as integer
dim shared isSingleMap as integer

'misc. init
randomize timer

'init screen
width 80, 25
	
view print 1 to 1
color 0, 1
cls

'start stuff
do	
	mainmenu
loop


'include all the subs and functions
'$include: "src_includes\_load_and_init.bi"
'$include: "src_includes\_render.bi"
'$include: "src_includes\_utils.bi"
'$include: "src_includes\_semi_action.bi"
'$include: "src_includes\_winning.bi"
'$include: "src_includes\_base_game.bi"
'$include: "src_includes\_pos_check.bi"
'$include: "src_includes\_player_use.bi"