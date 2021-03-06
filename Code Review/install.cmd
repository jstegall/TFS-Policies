@echo off

set p=%USERPROFILE%\AppData\Local\Microsoft\TFS Policies
set r=%p%\Code Review.reg
mkdir "%p%" 1>nul 2>&1
copy "Code Review.*" "%p%\*.*"

echo Windows Registry Editor Version 5.00>"%r%"
echo.>>"%r%"
echo [HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\12.0\TeamFoundation\SourceControl\Checkin Policies]>>"%r%"
set fn="Code Review"="%p%\Code Review.dll"
set fn2=%fn:\=\\%
echo %fn2%>>"%r%"

echo Registering Check-In Policy...
regedit /s "%r%"
echo Done.
echo.
echo.
echo Now restart VS
echo And activate this plugin (if not already activated)
echo   via "Team Explorer | Right-Click Project | Team Project Settings | Source Control... | Check-In Policy | Add...
echo   select "Code Review Policy" and press "OK".
echo.
echo.
pause
