@SET Bin="..\..\..\..\ZXDev\Bin"

%Bin%\sdcc DWRsrc.c -mz80 --no-std-crt0
@IF errorlevel 1 PAUSE
%Bin%\hex2bin DWRsrc.ihx
@PAUSE