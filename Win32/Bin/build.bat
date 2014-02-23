@SET WinDevBin=..\..\..\..\WinDev\Bin
@SET WinDevLib=..\..\..\..\WinDev\Lib
@SET Lib=..\Lib
@SET tcc=%WinDevBin%\tcc\tcc.exe

@COPY /B /Y GrCfgS.h GrCfg.h

%tcc% ..\Lib\DWRsrc.c DWConfig.c DarkWoods.c -D_WINGUI -I "." -I %WinDevLib% -I %Lib% %WinDevLib%\WinDev.a %WinDevLib%\Sdl\SdlLib.a %WinDevBin%\tcc\lib\SDL.def -o DarkWoods.exe
@IF errorlevel 1 PAUSE

@IF EXIST DarkWoods.exe MOVE DarkWoods.exe ..
@START ..\DarkWoods.exe
