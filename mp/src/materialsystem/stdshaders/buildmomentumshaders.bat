@echo off
setlocal

rem ================================
rem ==== MOD PATH CONFIGURATIONS ===

rem == Set the absolute path to your mod's game directory with gameinfo.txt ==
rem This should already be correct
set GAMEDIR="%cd%\..\..\..\game\momentum"

rem ==  Set the Path to your mod's root source code ==
rem This should already be correct
set SOURCEDIR="..\.."

rem Remove quotes from paths
call dequote.bat GAMEDIR
call dequote.bat SOURCEDIR

rem ==== MOD PATH CONFIGURATIONS END ===
rem ====================================

set TTEXE=..\..\devtools\bin\timeprecise.exe
if not exist %TTEXE% goto no_ttexe
goto no_ttexe_end

:no_ttexe
set TTEXE=time /t
:no_ttexe_end


rem echo.
rem echo ~~~~~~ buildsdkshaders %* ~~~~~~
%TTEXE% -cur-Q
set tt_all_start=%ERRORLEVEL%
set tt_all_chkpt=%tt_start%

set BUILD_SHADER=call buildshaders.bat
set ARG_EXTRA=

%BUILD_SHADER% momentum_dx9_20b -game %GAMEDIR% -source %SOURCEDIR%
%BUILD_SHADER% momentum_dx9_30 -game %GAMEDIR% -source %SOURCEDIR% -force30


rem echo.
if not "%dynamic_shaders%" == "1" (
  rem echo Finished full buildallshaders %*
) else (
  rem echo Finished dynamic buildallshaders %*
)

pause
