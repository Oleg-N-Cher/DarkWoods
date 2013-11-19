@SET WinDevBin=..\..\..\..\WinDev\Bin
@SET WinDevLib=..\..\..\..\WinDev\Lib
@SET Lib=..\Lib
@SET tcc=%WinDevBin%\tcc64\tcc.exe

%tcc% ..\Lib\DW2Rsrc.c DW2Config.c SemiAction.c DWoods2.c -D_WINGUI -I "." -I %WinDevLib% -I %Lib% %WinDevLib%\WinDev64.a %WinDevLib%\Sdl\SdlLib64.a %WinDevBin%\tcc\lib\SDL.def -o DWoods2.exe
@IF errorlevel 1 PAUSE

@IF EXIST DWoods2.exe MOVE DWoods2.exe ..\x64
@START ..\x64\DWoods2.exe
