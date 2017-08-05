@echo off
rem hidden
color a
:start
title renamer
cls
echo.
echo 1. add
echo 2. remove
echo 3. replace
echo 4. lowercase
echo.
echo x. exit
echo.
echo currently in %cd%
echo.
set /p choice=operation: 
cls
goto %choice%
:x
exit /b
:0
set choice=
exit /b
:1
echo.
echo 1 prefix
echo 2 suffix
echo.
set /p choice=affix: 
cls
goto %choice%_add
:2
echo.
echo 1 prefix
echo 2 suffix
echo.
set /p choice=affix: 
cls
goto %choice%_remove
:3
set /p source=source: 
set /p destination=destination: 
set argument="!file!" "!file:%source%=%destination%!"
goto exit
:4
set argument="!file!" "!file!"
goto exit
:1_add
set /p affix=prefix: 
set argument="!file!" "%affix%!file!"
goto exit
:2_add
set /p affix=suffix: 
set argument="!file!" "!file!%affix%"
goto exit
:1_remove
set /p affix=prefix (count): 
set argument="!file!" "!file:~%affix%!"
goto exit
:2_remove
set /p affix=suffix (count): 
set argument="!file!" "!file:~0,-%affix%!"
goto exit
:exit
cls
rem exclude directories: /a-d
setlocal enabledelayedexpansion
for /f "delims=*" %%f in ('dir /b /l') do (
set file=%%f
rename %argument%
)
setlocal disabledelayedexpansion
set choice=
set affix=
set file=
set source=
set destination=
set argument=
goto start
