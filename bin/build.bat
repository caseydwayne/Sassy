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
::css/monster.css --watch
pause