@SET CodeAddr=45056
@SET DataAddr=63488
@SET Bin=..\..\..\..\ZXDev\Bin
@SET Lib=..\..\..\..\ZXDev\Lib

@COPY /B /Y DWColorsS.h DWColors.h
@COPY /B /Y DWConfigS.h DWConfig.h
@COPY /B /Y GrCfgS.h GrCfg.h
%Bin%\sdcc -c %1.c -mz80 --opt-code-size -I "." -I %Lib%
@IF errorlevel 1 PAUSE
%Bin%\sdcc DarkWoods.c -mz80 --code-loc %CodeAddr% --data-loc %DataAddr% --opt-code-size -I "." -I %Lib% DWConfig.rel DWRsrc.rel XDev.lib Basic.lib
@IF errorlevel 1 PAUSE

%Bin%\hex2bin DarkWoods.ihx
%Bin%\bin2data.exe -rem -org %CodeAddr% DarkWoods.bin ..\DarkWoods.tap DarkWoods
::%Bin%\bin2data.exe -data -org %CodeAddr% DarkWoods.bin ..\DarkWoods.tap DarkWoods
@START ..\DarkWoods.tap