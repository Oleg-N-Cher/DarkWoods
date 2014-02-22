@SET WtkBin=d:\WIN32APP\Dev\WTK2.5.2_01\bin
@SET WtkLib=d:\WIN32APP\Dev\WTK2.5.2_01\lib
@SET JavaLib=d:\Program Files\Java\jre6\lib
@SET MidpLib="%JavaLib%\rt.jar";%WtkLib%\cldcapi10.jar;%WtkLib%\midpapi10.jar;%WtkLib%\mmapi.jar;%WtkLib%\jsr75.jar

@CD Obj
::@DEL *.cps

::@IF NOT EXIST Platform.cps CALL ..\Bin\cprun gpcp Platform.cp
::@IF errorlevel 1 PAUSE
::@RMDIR /S /Q CP\Platform
@IF NOT EXIST GrCfg.cps    CALL ..\Bin\cprun gpcp ..\Mod\GrCfg.cp
@IF errorlevel 1 PAUSE
@RMDIR /S /Q CP\GrCfg
::@REM IF NOT EXIST Timer.cps    CALL ..\Bin\cprun gpcp Timer.cp
::@IF errorlevel 1 PAUSE
@IF NOT EXIST GrScr.cps     CALL ..\Bin\cprun gpcp ..\Lib\Mod\GrScr.cp
@IF errorlevel 1 PAUSE
::@IF NOT EXIST GrColors.cps  CALL ..\Bin\cprun gpcp ..\Lib\Mod\GrColors.cp
::@IF errorlevel 1 PAUSE
::@RMDIR /S /Q CP\GrColors
::@IF NOT EXIST Rsrc.cps    CALL ..\Bin\cprun gpcp Rsrc.cp
::@IF errorlevel 1 PAUSE
@IF NOT EXIST GrPixel.cps   CALL ..\Bin\cprun gpcp ..\Lib\Mod\GrPixel.cp
@IF errorlevel 1 PAUSE
@IF NOT EXIST GrTiles.cps   CALL ..\Bin\cprun gpcp ..\Lib\Mod\GrTiles.cp
@IF errorlevel 1 PAUSE
@IF NOT EXIST GrFonts.cps   CALL ..\Bin\cprun gpcp ..\Lib\Mod\GrFonts.cp
@IF errorlevel 1 PAUSE
@IF NOT EXIST Console.cps   CALL ..\Bin\cprun gpcp ..\Lib\Mod\Console.cp
@IF errorlevel 1 PAUSE
@IF NOT EXIST Input.cps     CALL ..\Bin\cprun gpcp ..\Lib\Mod\Input.cp
@IF errorlevel 1 PAUSE
@IF NOT EXIST Timer.cps     CALL ..\Bin\cprun gpcp ..\Lib\Mod\Timer.cp
@IF errorlevel 1 PAUSE
@IF NOT EXIST DWConfig.cp  CALL ..\Bin\cprun gpcp ..\Mod\DWConfig.cp
@IF errorlevel 1 PAUSE
@RMDIR /S /Q CP\DWConfig
@IF NOT EXIST DWColors.cps CALL ..\Bin\cprun gpcp ..\Mod\DWColors.cp
@IF errorlevel 1 PAUSE
@RMDIR /S /Q CP\DWColors
@IF NOT EXIST DWRsrc.cps CALL ..\Bin\cprun gpcp ..\Mod\DWRsrc.cp
@IF errorlevel 1 PAUSE
@CALL ..\Bin\cprun gpcp ..\Mod\DarkWoods.Mod
@IF errorlevel 1 PAUSE

@IF NOT EXIST ${build}\obfuscate MKDIR ${build}\obfuscate
@XCOPY /I /S /Y CP ${build}\obfuscate\CP > NUL

@%WtkBin%\preverify -classpath '%MidpLib%' -d "${build}\preverified" "%CD%\${build}\obfuscate" -cldc
@CALL ant

@CD..
@PAUSE

