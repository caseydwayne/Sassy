@echo off
title=Sassy Tests
::setup
set origin="%CD%"

::pathwork
set sp=%origin%\..
cd %sp%

:run
sass test.scss
:end

pause>nul

echo Press any key to run test again (control+c to exit)


cls
goto :run

::logic
cmd \k
pause