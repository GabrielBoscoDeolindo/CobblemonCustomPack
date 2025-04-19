@echo off
setlocal

echo === Minecraft Setup Script ===

set BASE_PATH=%~dp0
set MC_BASE=%APPDATA%\.minecraft
set RP_FILE=%BASE_PATH%resourcepacks.zip
set MODS_SOURCE=%BASE_PATH%mods
set RP_DEST=%MC_BASE%\resourcepacks
set MODS_DEST=%MC_BASE%\mods

echo Moving resourcepacks.zip to %RP_DEST%...
if not exist "%RP_DEST%" (
    mkdir "%RP_DEST%"
)
if exist "%RP_FILE%" (
    move /Y "%RP_FILE%" "%RP_DEST%"
    echo resourcepacks.zip moved successfully.
) else (
    echo resourcepacks.zip not found at %RP_FILE%.
)

echo Moving mod files to %MODS_DEST%...
if not exist "%MODS_DEST%" (
    mkdir "%MODS_DEST%"
)
if exist "%MODS_SOURCE%\*" (
    move /Y "%MODS_SOURCE%\*" "%MODS_DEST%"
    echo Mod files moved successfully.
) else (
    echo No files found in %MODS_SOURCE%.
)

echo === Done ===
pause
