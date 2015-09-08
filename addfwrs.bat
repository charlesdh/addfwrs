@echo off
REM      BATCH FILE CREATED BY CHARLES DE HAVILLAND 20/02/2012, v2 08/09/2015
cls
If "%1"=="" GOTO :norulename
SET RULENAME=%1
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
ECHO.
ECHO|set /p ="- Add "
call :ColorText 0a "Block In & Out "
ECHO  Firewall rules for all *.exe ^& *.dll files,
ECHO.
ECHO|set /p = "- located at '"
  call :ColorText 0b "%CD%'" 
ECHO  (inc subfolders),
ECHO.
ECHO|set /p = "- using "
  call :ColorText 1e "%RULENAME%"
ECHO  as the Firewall rule name ?
ECHO.
ECHO.
ECHO.
ECHO press CTRL+C to stop now or
pause
cls
Echo.
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
Echo.
Echo done.
GOTO :Finish

:norulename
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
for %%* in (.) do set RULENAME=%%~nx*
ECHO.
ECHO|set /p ="- Add "
call :ColorText 0a "Block In & Out "
ECHO  Firewall rules for all *.exe ^& *.dll files
ECHO.
ECHO|set /p = "- located at '"
  call :ColorText 0b "%CD%'" 
ECHO  (inc subfolders)
ECHO.
ECHO|set /p = "- creating "
  call :ColorText 1b "%RULENAME%"
ECHO  as the Firewall rule name ?
ECHO.
ECHO.
ECHO.
ECHO press CTRL+C to stop now or
pause
cls
Echo.
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
Echo.
Echo done.
goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:Finish
Echo.
Echo.
Echo Batch ended...