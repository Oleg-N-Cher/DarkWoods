@SET CodeAddr=45056
@SET DataAddr=63488
@SET Bin=..\..\..\..\ZXDev\Bin
@SET Lib=..\..\..\..\ZXDev\Lib

%Bin%\sdcc -c %1.c -mz80 --opt-code-size -I "." -I %Lib%
@IF errorlevel 1 PAUSE
%Bin%\sdcc DWoods2.c -mz80 --code-loc %CodeAddr% --data-loc %DataAddr% --no-std-crt0 --opt-code-size -I "." -I %Lib% Dw2Config.rel Dw2Rsrc.rel SemiAction.rel XDev.lib Basic.lib
@IF errorlevel 1 PAUSE

%Bin%\hex2bin DWoods2.ihx
%Bin%\bin2data.exe -rem -org %CodeAddr% DWoods2.bin ..\DWoods2.tap DWoods2
@START ..\DWoods2.tap