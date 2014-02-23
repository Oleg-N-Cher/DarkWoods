@SET WinDevBin=..\..\..\..\WinDev\Bin
@SET WinDevLib=..\..\..\..\WinDev\Lib
@SET Lib=..\Lib
@SET tcc=%WinDevBin%\tcc64\tcc.exe

@COPY /B /Y GrCfgS.h GrCfg.h

%tcc% ..\Lib\DWRsrc.c DWConfig.c DarkWoods.c -D_WINGUI -I "." -I %WinDevLib% -I %Lib% %WinDevLib%\WinDev64.a %WinDevLib%\Sdl\SdlLib64.a %WinDevBin%\tcc\lib\SDL.def -o DarkWoods.exe
@IF errorlevel 1 PAUSE

@IF EXIST DarkWoods.exe MOVE DarkWoods.exe ..\x64
@START ..\x64\DarkWoods.exe
