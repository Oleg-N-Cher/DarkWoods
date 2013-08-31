@SET WinDevBin=..\..\..\..\WinDev\Bin
@SET WinDevLib=..\..\..\..\WinDev\Lib
@SET Lib=..\Lib
@SET tcc=%WinDevBin%\tcc\tcc.exe

%tcc% ..\Lib\DW2Rsrc.c DW2Config.c SemiAction.c DWoods2.c -D_WINGUI -I "." -I %WinDevLib% -I %Lib% %WinDevLib%\WinDev.a %WinDevLib%\Sdl\SdlLib.a %WinDevBin%\tcc\lib\SDL.def -o DWoods2.exe
@IF errorlevel 1 PAUSE

@IF EXIST DWoods2.exe MOVE DWoods2.exe ..
@START ..\DWoods2.exe
