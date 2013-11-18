@CD ..
@SET RootBin=..\..\Bin
@SET WinDevBin=..\Bin
@SET tcc=%WinDevBin%\tcc64\tcc.exe

@IF EXIST %1.lib DEL %1.lib
%RootBin%\smartlib %1.c
@FOR %%i IN (%1_0??.c) DO (
  %tcc% -c %%i -I "." -I Obj64
  @IF errorlevel 1 PAUSE
)
@FOR %%i IN (%1_0??.o) DO %WinDevBin%\ar64 -rc %1.a %%i