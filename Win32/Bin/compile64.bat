@SET WinDevBin=..\..\..\..\WinDev\Bin
@SET WinDevLib=..\..\..\..\WinDev\Lib
@SET Lib=..\Lib
@SET tcc=%WinDevBin%\tcc64\tcc.exe

%tcc% -c %1.c -I "." -I %WinDevLib% -I ..\Lib
@IF errorlevel 1 PAUSE
