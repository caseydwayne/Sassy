@echo off
title=node test
::setup
set origin="%CD%"

::pathwork
set sp=%origin%\..
cd %sp%

:run
sass scss/test.scss --stdout
:end
pause >nul

echo Press any key to run test again (control+c to exit)


cls
goto :run

::logic
cmd \k
pause