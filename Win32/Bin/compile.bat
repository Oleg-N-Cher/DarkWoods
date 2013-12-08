@SET WinDevBin=..\..\..\..\WinDev\Bin
@SET WinDevLib=..\..\..\..\WinDev\Lib
@SET Lib=..\Lib
@SET tcc=%WinDevBin%\tcc\tcc.exe

%tcc% -c %1.c -I "." -I %WinDevLib% -I ..\Lib -I %Lib%\Obj
@IF errorlevel 1 PAUSE
