@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem ============================================================
rem  set_user_environment.bat
rem
rem  For the current user (no administrator rights needed), this
rem  script registers -- for the folder it is launched from:
rem    * STUDDFT  -- set STUDDFT to that folder, so StudDFT can
rem                  find its basis_data\ library. Any existing
rem                  STUDDFT value is overwritten.
rem    * PATH     -- append that folder to the per-user PATH,
rem                  but only if it is not already there.
rem
rem  Target OS: Windows 7 / 10 / 11, plain cmd.exe.
rem  Both values live in HKCU\Environment, which the current user
rem  may always write, so no elevation is required.
rem
rem  Design notes
rem  ------------
rem  * The folder is taken from %~dp0 (the folder THIS .bat lives
rem    in), so it is correct whether the file is double-clicked in
rem    Explorer or run from a command prompt in another directory.
rem    (%CD% is NOT used: it can point elsewhere when the file is
rem    started via a shortcut or an already-changed directory.)
rem  * The path is read at run time from %~dp0, so the text
rem    encoding of this .bat file itself does not matter; the real
rem    path (including spaces or non-ASCII characters) is passed to
rem    reg.exe as-is.
rem  * We use reg.exe, not setx: setx truncates values at 1024
rem    characters and would rewrite PATH as REG_SZ (breaking
rem    entries like %USERPROFILE%). reg.exe keeps the raw value
rem    and its original type.
rem  * PATH is read from the registry, not from %PATH% (the latter
rem    is the already-expanded system+user merge and must not be
rem    written back).
rem  * Limitation: a folder name that literally contains '!' is not
rem    supported (delayed expansion consumes it). This never
rem    happens with real installation folders.
rem ============================================================

rem ---- Folder of THIS script, without trailing backslash -----
rem %~dp0 is the script's own folder and always ends with '\'.
rem This is the correct value for an Explorer double-click as well
rem as for launching from any command prompt.
set "TARGET=%~dp0"
if "%TARGET:~-1%"=="\" set "TARGET=%TARGET:~0,-1%"

echo Folder for STUDDFT and PATH:
echo     "!TARGET!"
echo.

set "REGKEY=HKCU\Environment"

rem ============================================================
rem  STUDDFT -- create or overwrite, pointing at this folder
rem ============================================================
rem reg add with /f writes the value whether or not it already
rem exists, so an existing STUDDFT is simply overwritten and there
rem is no need to read it first. Type REG_SZ stores the path
rem literally (it contains no %...% to expand). This runs first and
rem unconditionally, so STUDDFT is set even when the folder is
rem already present in PATH below.
reg add "%REGKEY%" /v STUDDFT /t REG_SZ /d "!TARGET!" /f >nul
if errorlevel 1 (
    echo ERROR: failed to write STUDDFT to the registry.
    echo.
    pause
    exit /b 1
)
echo STUDDFT set to "!TARGET!"

rem ============================================================
rem  PATH -- append this folder, only if not already present
rem ============================================================
rem A fresh profile may have no Path value at all; in that case
rem reg.exe fails, CURPATH stays empty, and we create Path below.
set "CURPATH="
set "PATHTYPE="
for /f "tokens=1,2,*" %%A in ('reg query "%REGKEY%" /v Path 2^>nul ^| find /i "Path"') do (
    set "PATHTYPE=%%B"
    set "CURPATH=%%C"
)

rem Keep the original value type; default to REG_EXPAND_SZ (also
rem used when we create a brand-new Path value).
if /i not "!PATHTYPE!"=="REG_SZ" if /i not "!PATHTYPE!"=="REG_EXPAND_SZ" set "PATHTYPE=REG_EXPAND_SZ"

if not defined CURPATH (
    rem No user PATH yet: create it with just this folder.
    set "NEWPATH=!TARGET!"
    goto :WRITE_PATH
)

rem Is TARGET already a complete entry in PATH? Pad with ';' so a
rem whole entry is matched ("C:\Foo" must not match "C:\FooBar").
rem Case-insensitive; tested with and without a trailing '\'.
set "HAYSTACK=;!CURPATH!;"
set "FOUND="
set "TST=!HAYSTACK:;%TARGET%;=;!"
if not "!TST!"=="!HAYSTACK!" set "FOUND=1"
set "TST=!HAYSTACK:;%TARGET%\;=;!"
if not "!TST!"=="!HAYSTACK!" set "FOUND=1"

if defined FOUND (
    echo PATH already contains this folder; left unchanged.
    goto :DONE
)

rem Append, avoiding a double ';'.
if "!CURPATH:~-1!"==";" (
    set "NEWPATH=!CURPATH!!TARGET!"
) else (
    set "NEWPATH=!CURPATH!;!TARGET!"
)

:WRITE_PATH
reg add "%REGKEY%" /v Path /t !PATHTYPE! /d "!NEWPATH!" /f >nul
if errorlevel 1 (
    echo ERROR: failed to write PATH to the registry.
    echo.
    pause
    exit /b 1
)
echo This folder was added to your user PATH.

:DONE
echo.
echo Done. Open a NEW command prompt (or sign out and back in)
echo so that other programs pick up STUDDFT and PATH.
echo.
pause
exit /b 0
