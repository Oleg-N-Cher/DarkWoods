@SET obj=..\..\..\Ofront\Obj
@SET tcc=..\..\..\WinDev\Bin\tcc\tcc.exe
@SET lib=..\..\..\ZXDev\Bin\MakeZX\Obj

@CD Obj
@REM DEL *.o

@IF EXIST %obj%\Utils.h MOVE /Y %obj%\Utils.h
@IF EXIST %obj%\Utils.c MOVE /Y %obj%\Utils.c

%tcc% -c Utils.c -I %lib% -L %lib%

@REM IF EXIST MakeZX.exe MOVE MakeZX.exe ..
@PAUSE
