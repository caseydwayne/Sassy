@echo off
title=Building CSS Monster
::setup
set origin="%CD%"

::pathwork
set root=..
cd %root%

::logic
echo Compiling Monster
echo.
sass scss/monster.scss

echo Press any key to compile SASS again (control+c to exit)
pause >nul

cls
goto :run

::logic
cmd \k
pause