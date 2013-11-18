@SET Lib=..\..\..\..\WinDev\Lib
@SET Obj=%Lib%\Obj
@SET tcc=..\..\..\..\WinDev\Bin\tcc64\tcc.exe

@IF EXIST ..\%1.c GOTO levelup
..\%tcc% -c %1.c -I ".." -I ..\%Lib% -I ..\%Obj%
@GOTO exit

:levelup
CD ..
%tcc% -c %1.c -I "." -I %Lib% -I %Obj%

:exit
@IF errorlevel 1 PAUSE
